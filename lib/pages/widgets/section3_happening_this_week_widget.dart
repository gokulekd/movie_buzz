import 'package:flutter/material.dart';
import 'package:movie_buzz/model/main_data_model.dart';

class Section3HappeningThisWeekWidget extends StatelessWidget {
  final MainDataModel dataModel;

  const Section3HappeningThisWeekWidget({super.key, required this.dataModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20),
        itemCount: dataModel.data.section3.data.length,
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
                    dataModel.data.section3.data[index].image!,
                    width: 150,
                    height: 150,

                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, bottom: 30),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(80, 20, 20, 20),
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 16,
                        top: 8,
                      ),
                      child: Wrap(
                        children: [
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 3.0,
                              bottom: 4,
                            ),
                            child: Text(
                              dataModel.data.section3.data[index].rank
                                  .toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,

                                fontSize: 18,
                                shadows: [
                                  Shadow(
                                    blurRadius: 6.0,
                                    color: Colors.black,
                                    offset: Offset(2.0, 2.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Title
            ],
          );
        },
      ),
    );
  }
}
