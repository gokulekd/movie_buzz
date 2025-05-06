abstract class VideoEvent {}

class LoadVideos extends VideoEvent {
  final List<String> videoUrls;

  LoadVideos(this.videoUrls);
}

class PlayVideoAtIndex extends VideoEvent {
  final int index;

  PlayVideoAtIndex(this.index);
}

class TogglePlayPause extends VideoEvent {
  final int index;

  TogglePlayPause(this.index);
}

class DisposeVideo extends VideoEvent {}
