import 'package:flutter/material.dart';
import 'package:movie_buzz/model/main_data_model.dart';

class Section1TrendingNewsWidget extends StatelessWidget {
  final MainDataModel dataModel;

  const Section1TrendingNewsWidget({super.key, required this.dataModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataModel.data.section1.data.length,
        itemBuilder: (context, index) {
          return Container(
            width: 280, // Card width
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      dataModel.data.section1.data[index].image!,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Title
                Text(
                  dataModel.data.section1.data[index].title!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                // Description
                Text(
                  dataModel.data.section1.data[index].description ?? "",
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
