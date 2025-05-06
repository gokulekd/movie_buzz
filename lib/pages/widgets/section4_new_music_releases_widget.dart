import 'package:flutter/material.dart';
import 'package:movie_buzz/model/main_data_model.dart';

class Section4NewMusicReleasesWidget extends StatelessWidget {
  final MainDataModel dataModel;

  const Section4NewMusicReleasesWidget({super.key, required this.dataModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20),
        itemCount: dataModel.data.section4.data.length,
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
                  child: Image.network(
                    dataModel.data.section4.data[index].image!,
                    width: 300,
                    height: 200,

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
                    minimumSize: const Size(80, 40), // width, height

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
