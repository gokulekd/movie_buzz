import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_buzz/model/main_data_model.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Section2VideoCarouselWidget extends StatefulWidget {
  final MainDataModel trailers;

  const Section2VideoCarouselWidget({super.key, required this.trailers});

  @override
  State<Section2VideoCarouselWidget> createState() =>
      _Section2VideoCarouselWidgetState();
}

class _Section2VideoCarouselWidgetState
    extends State<Section2VideoCarouselWidget> {
  final Map<int, VideoPlayerController> _controllers = {};
  bool _isLoading = true;
  int _currentPlayingIndex = -1;
  int currentPage = 0;

  List<dynamic> get _mediaItems => widget.trailers.data.section2.data;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  Future<void> _initializeControllers() async {
    for (int i = 0; i < _mediaItems.length; i++) {
      final item = _mediaItems[i];
      if (item.mediaType.startsWith("video")) {
        final controller = VideoPlayerController.networkUrl(
          Uri.parse(item.media!),
        );
        await controller.initialize();
        controller.setLooping(true);
        _controllers[i] = controller;
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _playVideoAtIndex(int index) {
    if (_currentPlayingIndex != index) {
      if (_currentPlayingIndex >= 0 &&
          _controllers.containsKey(_currentPlayingIndex)) {
        _controllers[_currentPlayingIndex]?.pause();
      }

      if (_controllers.containsKey(index)) {
        _controllers[index]?.play();
        _currentPlayingIndex = index;
      }
    }
  }

  void _togglePlayPause(int index) {
    final controller = _controllers[index];

    if (controller!.value.isPlaying) {
      controller.pause();
    } else {
      _playVideoAtIndex(index);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 600,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: Colors.grey[200],
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Trending trailers loading... please wait..."),
                  SizedBox(height: 30),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: _mediaItems.length,
          itemBuilder: (context, index, realIndex) {
            final item = _mediaItems[index];
            final isVideo = item.mediaType.startsWith("video");

            if (!isVideo) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    item.media ?? '',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder:
                        (_, __, ___) =>
                            const Icon(Icons.broken_image, size: 64),
                  ),
                ),
              );
            }

            final controller = _controllers[index]!;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: VisibilityDetector(
                key: Key("video_$index"),
                onVisibilityChanged: (info) {
                  if (info.visibleFraction > 0.5) {
                    _playVideoAtIndex(index);
                  } else if (_currentPlayingIndex == index) {
                    controller.pause();
                  }
                },
                child: AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: GestureDetector(
                    onTap: () => _togglePlayPause(index),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          VideoPlayer(controller),
                          if (!controller.value.isPlaying)
                            const Icon(
                              Icons.play_circle_fill,
                              color: Colors.white70,
                              size: 64,
                            ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 100,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.white54,
                                    Colors.white,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            animateToClosest: true,
            height: 600,
            viewportFraction: 0.99,
            onPageChanged: (index, reason) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),
        const SizedBox(height: 50),
        _buildPageIndicator(),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_mediaItems.length, (index) {
        final isActive = index == _currentPlayingIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 8 : 5,
          height: isActive ? 8 : 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? Colors.black : Colors.grey,
          ),
        );
      }),
    );
  }
}
