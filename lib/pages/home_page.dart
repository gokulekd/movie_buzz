import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/bloc/data%20bloc/data_bloc.dart';
import 'package:movie_buzz/bloc/data%20bloc/data_event.dart';
import 'package:movie_buzz/bloc/data%20bloc/data_state.dart';
import 'package:movie_buzz/model/main_data_model.dart';
import 'package:movie_buzz/pages/widgets/banner_widget.dart';
import 'package:movie_buzz/pages/widgets/find_your_requirment_category_widget.dart';
import 'package:movie_buzz/pages/widgets/menu_card_grid_widget.dart';
import 'package:movie_buzz/pages/widgets/section1_trending_news_widget.dart';
import 'package:movie_buzz/pages/widgets/section2_video_carousel_widget.dart';
import 'package:movie_buzz/pages/widgets/section3_happening_this_week_widget.dart';
import 'package:movie_buzz/pages/widgets/section4_new_music_releases_widget.dart';
import 'package:movie_buzz/pages/widgets/section5_recommended_movies_widget.dart';
import 'package:movie_buzz/pages/widgets/section_main_title_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<DataBloc>().add(FetchDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        if (state is DataLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DataLoaded) {
          final MainDataModel data = state.data; // this is your MainDataModel

          return RefreshIndicator(
            onRefresh: () async {
              context.read<DataBloc>().add(FetchDataEvent());
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BannerWidget(data: data),
                  const SizedBox(height: 20),
                  FindYourRequirmentsCategoryWidget(data: data),
                  const SizedBox(height: 20),

                  MenuCardGridWidget(dataModel: data),
                  const SizedBox(height: 20),
                  SectionMainTitleWidget(
                    title: data.data.sectionTitles.first.section1Name,
                  ),

                  const SizedBox(height: 20),
                  Section1TrendingNewsWidget(dataModel: data),
                  const SizedBox(height: 20),
                  SectionMainTitleWidget(
                    title: data.data.sectionTitles.first.section2Name,
                  ),

                  const SizedBox(height: 20),
                  Section2VideoCarouselWidget(trailers: data),
                  const SizedBox(height: 20),
                  SectionMainTitleWidget(
                    title: data.data.sectionTitles.first.section3Name,
                  ),

                  const SizedBox(height: 20),
                  Section3HappeningThisWeekWidget(dataModel: data),
                  const SizedBox(height: 20),
                  SectionMainTitleWidget(
                    title: data.data.sectionTitles.first.section5Name,
                  ),

                  const SizedBox(height: 20),
                  Section5RecommendedMoviesWidget(dataModel: data),
                  const SizedBox(height: 20),
                  SectionMainTitleWidget(
                    title: data.data.sectionTitles.first.section4Name,
                  ),

                  const SizedBox(height: 20),
                  Section4NewMusicReleasesWidget(dataModel: data),
                ],
              ),
            ),
          );
        } else if (state is DataError) {
          return Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: Card(
                color: Colors.white,
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, color: Colors.red),

                    Text(
                      "something went wrong",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Center(child: Text("message : ${state.message}")),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const SizedBox(); // or a placeholder
        }
      },
    );
  }
}
