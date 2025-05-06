import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/bloc/video%20bloc/video_event.dart';
import 'package:movie_buzz/bloc/video%20bloc/video_state.dart';
import 'package:video_player/video_player.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super(VideoState.initial()) {
    on<LoadVideos>(_onLoadVideos);
    on<PlayVideoAtIndex>(_onPlayVideo);
    on<TogglePlayPause>(_onTogglePlayPause);
    on<DisposeVideo>(_onDisposeVideo);
  }

  Future<void> _onLoadVideos(LoadVideos event, Emitter<VideoState> emit) async {
    emit(state.copyWith(isLoading: true));

    List<VideoPlayerController> controllers = [];
    int errorCount = 0;

    for (var url in event.videoUrls) {
      try {
        final controller = VideoPlayerController.networkUrl(Uri.parse(url));
        await controller.initialize();
        controller.setLooping(true);
        // Set volume to 0 initially to prevent audio overlap
        controller.setVolume(0.5);
        controllers.add(controller);
      } catch (e) {
        print("Error initializing video player for URL: $url - $e");
        errorCount++;
        // Add a placeholder controller to maintain index alignment
        controllers.add(
          VideoPlayerController.networkUrl(
            Uri.parse(
              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
            ),
          ),
        );
      }
    }

    // If we failed to load any videos, make sure we're not in a loading state forever
    if (controllers.isEmpty) {
      emit(state.copyWith(isLoading: false, hasError: true));
      return;
    }

    emit(
      state.copyWith(
        controllers: controllers,
        isLoading: false,
        hasError: errorCount > 0,
      ),
    );
  }

  Future<void> _onPlayVideo(
    PlayVideoAtIndex event,
    Emitter<VideoState> emit,
  ) async {
    if (state.controllers.isEmpty || event.index >= state.controllers.length) {
      return;
    }

    final controllers = state.controllers;
    final current = state.currentPlayingIndex;

    // Pause the currently playing video if there is one
    if (current != -1 && current < controllers.length) {
      try {
        await controllers[current].pause();
      } catch (e) {
        print("Error pausing video at index $current: $e");
      }
    }

    try {
      // Start playing the new video
      await controllers[event.index].play();
      emit(state.copyWith(currentPlayingIndex: event.index));
    } catch (e) {
      print("Error playing video at index ${event.index}: $e");
    }
  }

  Future<void> _onTogglePlayPause(
    TogglePlayPause event,
    Emitter<VideoState> emit,
  ) async {
    if (state.controllers.isEmpty || event.index >= state.controllers.length) {
      return;
    }

    final controller = state.controllers[event.index];

    try {
      if (controller.value.isPlaying) {
        await controller.pause();
      } else {
        // If we're playing a different video than before, pause the old one
        if (state.currentPlayingIndex != event.index &&
            state.currentPlayingIndex != -1) {
          await state.controllers[state.currentPlayingIndex].pause();
        }
        await controller.play();
        emit(state.copyWith(currentPlayingIndex: event.index));
      }
    } catch (e) {
      print("Error toggling video at index ${event.index}: $e");
    }
  }

  Future<void> _onDisposeVideo(
    DisposeVideo event,
    Emitter<VideoState> emit,
  ) async {
    for (var controller in state.controllers) {
      try {
        await controller.pause();
        await controller.dispose();
      } catch (e) {
        print("Error disposing video controller: $e");
      }
    }
    emit(VideoState.initial());
  }

  @override
  Future<void> close() async {
    for (var controller in state.controllers) {
      try {
        await controller.pause();
        await controller.dispose();
      } catch (e) {
        print("Error disposing video controller during bloc close: $e");
      }
    }
    return super.close();
  }
}
