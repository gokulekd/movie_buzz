abstract class VideoCarouselEvent {}

class InitializeVideos extends VideoCarouselEvent {}

class PlayVideoAtIndex extends VideoCarouselEvent {
  final int index;
  PlayVideoAtIndex(this.index);
}

class TogglePlayPause extends VideoCarouselEvent {
  final int index;
  TogglePlayPause(this.index);
}
