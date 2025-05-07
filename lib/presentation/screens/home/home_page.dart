import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/data/model/main_data_model.dart';
import 'package:movie_buzz/logic/data_bloc/data_bloc.dart';
import 'package:movie_buzz/logic/data_bloc/data_event.dart';
import 'package:movie_buzz/logic/data_bloc/data_state.dart';
import 'package:movie_buzz/presentation/components/error_widget.dart';
import 'package:movie_buzz/presentation/screens/home/widgets/banner_widget.dart';
import 'package:movie_buzz/presentation/screens/home/widgets/find_your_requirment_category_widget.dart';
import 'package:movie_buzz/presentation/screens/home/widgets/menu_card_grid_widget.dart';
import 'package:movie_buzz/presentation/screens/home/widgets/section1_trending_news_widget.dart';
import 'package:movie_buzz/presentation/screens/home/widgets/section2_video_carousel_widget.dart';
import 'package:movie_buzz/presentation/screens/home/widgets/section3_happening_this_week_widget.dart';
import 'package:movie_buzz/presentation/screens/home/widgets/section4_new_music_releases_widget.dart';
import 'package:movie_buzz/presentation/screens/home/widgets/section5_recommended_movies_widget.dart';
import 'package:movie_buzz/presentation/screens/home/widgets/section_main_title_widget.dart';

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
                spacing: 20,
                children: [
                  //1 top banner widget
                  BannerWidget(data: data),
                  //2 requirment main widget with all category
                  FindYourRequirmentsCategoryWidget(data: data),
                  //3  main grid card with all menu
                  MenuCardGridWidget(dataModel: data),
                  //4  trending news with section 1 data title
                  SectionMainTitleWidget(
                    title: data.data.sectionTitles.first.section1Name,
                  ),
                  //5  trending news with section 1 data widget
                  Section1TrendingNewsWidget(dataModel: data),
                  //6  trending trailers with section 2 data title
                  SectionMainTitleWidget(
                    title: data.data.sectionTitles.first.section2Name,
                  ),

                  //7  trending trailers with section 2 data widget
                  Section2VideoCarouselWidget(trailers: data),

                  //8  happening this week with section 3 data title
                  SectionMainTitleWidget(
                    title: data.data.sectionTitles.first.section3Name,
                  ),

                  //9  happening this week with section 3 data widget
                  Section3HappeningThisWeekWidget(dataModel: data),
                  //10 recommended movies with section5 title
                  SectionMainTitleWidget(
                    title: data.data.sectionTitles.first.section5Name,
                  ),

                  //11 recommended movies with section5 widget
                  Section5RecommendedMoviesWidget(dataModel: data),
                  //12 new music releases with section 4 title
                  SectionMainTitleWidget(
                    title: data.data.sectionTitles.first.section4Name,
                  ),
                  //13 new music releases with section 4 widget
                  Section4NewMusicReleasesWidget(dataModel: data),
                ],
              ),
            ),
          );
        } else if (state is DataError) {
          return CommonErrorWidget();
        } else {
          return const SizedBox(); // or a placeholder
        }
      },
    );
  }
}
