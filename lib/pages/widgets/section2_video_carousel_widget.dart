import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/bloc/video%20bloc/video_bloc.dart';
import 'package:movie_buzz/bloc/video%20bloc/video_event.dart';
import 'package:movie_buzz/bloc/video%20bloc/video_state.dart';
import 'package:movie_buzz/model/main_data_model.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Section2VideoCarouselWidget extends StatelessWidget {
  final MainDataModel trailers;

  const Section2VideoCarouselWidget({super.key, required this.trailers});

  List<dynamic> get _mediaItems => trailers.data.section2.data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VideoCarouselBloc(_mediaItems)..add(InitializeVideos()),
      child: BlocBuilder<VideoCarouselBloc, VideoCarouselState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
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

                  final controller = state.controllers[index]!;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: VisibilityDetector(
                      key: Key("video_$index"),
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction > 0.5) {
                          context.read<VideoCarouselBloc>().add(
                            PlayVideoAtIndex(index),
                          );
                        } else if (state.currentPlayingIndex == index) {
                          controller.pause();
                        }
                      },
                      child: AspectRatio(
                        aspectRatio: controller.value.aspectRatio,
                        child: GestureDetector(
                          onTap:
                              () => context.read<VideoCarouselBloc>().add(
                                TogglePlayPause(index),
                              ),
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
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_mediaItems.length, (index) {
                  final isActive = index == state.currentPlayingIndex;
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
              ),
            ],
          );
        },
      ),
    );
  }
}
