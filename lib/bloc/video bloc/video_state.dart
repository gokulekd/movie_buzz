import 'package:video_player/video_player.dart';

class VideoState {
  final List<VideoPlayerController> controllers;
  final int currentPlayingIndex;
  final bool isLoading;
  final bool hasError;

  VideoState({
    required this.controllers,
    required this.currentPlayingIndex,
    required this.isLoading,
    this.hasError = false,
  });

  factory VideoState.initial() => VideoState(
    controllers: [],
    currentPlayingIndex: -1,
    isLoading: true,
    hasError: false,
  );

  VideoState copyWith({
    List<VideoPlayerController>? controllers,
    int? currentPlayingIndex,
    bool? isLoading,
    bool? hasError,
  }) {
    return VideoState(
      controllers: controllers ?? this.controllers,
      currentPlayingIndex: currentPlayingIndex ?? this.currentPlayingIndex,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}
