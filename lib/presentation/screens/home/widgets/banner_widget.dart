import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_buzz/data/model/main_data_model.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key, required this.data});

  final MainDataModel data;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200, // Adjust height as needed for landscape ratio
        aspectRatio: 16 / 9, // Standard landscape aspect ratio
        viewportFraction: 1.0, // Takes full width
        autoPlay: true, // Optional: auto-play the carousel
        enlargeCenterPage: false,
      ),
      items:
          data.data.banners.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  child: ExtendedImage.network(
                    url.image,
                    fit: BoxFit.cover,
                    cache: true, // Enable caching

                    loadStateChanged: (state) {
                      switch (state.extendedImageLoadState) {
                        case LoadState.loading:
                          return Container(
                            color: Colors.grey[100],
                            child: const Center(),
                          );
                        case LoadState.completed:
                          return null; // Return null to display the image
                        case LoadState.failed:
                          return Container(
                            color: Colors.grey[200],
                            child: const Center(
                              child: Icon(Icons.error, color: Colors.red),
                            ),
                          );
                      }
                    },
                  ),
                );
              },
            );
          }).toList(),
    );
  }
}
