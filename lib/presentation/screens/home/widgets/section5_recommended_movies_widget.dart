import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_buzz/data/model/main_data_model.dart';

class Section5RecommendedMoviesWidget extends StatelessWidget {
  final MainDataModel dataModel;

  const Section5RecommendedMoviesWidget({super.key, required this.dataModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20),
        itemCount: dataModel.data.section5.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              // Image Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ExtendedImage.network(
                    cache: true,
                    dataModel.data.section5[index].image,
                    width: 300,
                    height: 400,

                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                bottom: 12,
                right: 12,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(95, 137, 137, 137),
                    minimumSize: const Size(100, 40), // width, height

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("View"),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
