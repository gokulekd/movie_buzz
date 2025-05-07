import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/logic/video_bloc/video_event.dart';
import 'package:movie_buzz/logic/video_bloc/video_state.dart';
import 'package:video_player/video_player.dart';

class VideoCarouselBloc extends Bloc<VideoCarouselEvent, VideoCarouselState> {
  final List<dynamic> mediaItems;

  VideoCarouselBloc(this.mediaItems)
    : super(
        VideoCarouselState(
          controllers: {},
          isLoading: true,
          currentPlayingIndex: -1,
        ),
      ) {
    on<InitializeVideos>(_onInitialize);
    on<PlayVideoAtIndex>(_onPlayAtIndex);
    on<TogglePlayPause>(_onTogglePlayPause);
  }

  Future<void> _onInitialize(
    InitializeVideos event,
    Emitter<VideoCarouselState> emit,
  ) async {
    final Map<int, VideoPlayerController> controllers = {};

    for (int i = 0; i < mediaItems.length; i++) {
      final item = mediaItems[i];
      if (item.mediaType.startsWith("video")) {
        final controller = VideoPlayerController.networkUrl(
          Uri.parse(item.media!),
        );
        await controller.initialize();
        controller.setLooping(true);
        controllers[i] = controller;
      }
    }

    emit(state.copyWith(controllers: controllers, isLoading: false));
  }

  void _onPlayAtIndex(
    PlayVideoAtIndex event,
    Emitter<VideoCarouselState> emit,
  ) {
    final controllers = state.controllers;
    final previous = state.currentPlayingIndex;

    if (previous != event.index && controllers.containsKey(previous)) {
      controllers[previous]?.pause();
    }

    if (controllers.containsKey(event.index)) {
      controllers[event.index]?.play();
    }

    emit(state.copyWith(currentPlayingIndex: event.index));
  }

  void _onTogglePlayPause(
    TogglePlayPause event,
    Emitter<VideoCarouselState> emit,
  ) {
    final controller = state.controllers[event.index];

    if (controller != null) {
      if (controller.value.isPlaying) {
        controller.pause();
      } else {
        add(PlayVideoAtIndex(event.index));
      }
    }
  }

  @override
  Future<void> close() {
    for (var controller in state.controllers.values) {
      controller.dispose();
    }
    return super.close();
  }
}
