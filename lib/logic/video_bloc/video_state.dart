import 'package:video_player/video_player.dart';

class VideoCarouselState {
  final Map<int, VideoPlayerController> controllers;
  final bool isLoading;
  final int currentPlayingIndex;

  VideoCarouselState({
    required this.controllers,
    required this.isLoading,
    required this.currentPlayingIndex,
  });

  VideoCarouselState copyWith({
    Map<int, VideoPlayerController>? controllers,
    bool? isLoading,
    int? currentPlayingIndex,
  }) {
    return VideoCarouselState(
      controllers: controllers ?? this.controllers,
      isLoading: isLoading ?? this.isLoading,
      currentPlayingIndex: currentPlayingIndex ?? this.currentPlayingIndex,
    );
  }
}
