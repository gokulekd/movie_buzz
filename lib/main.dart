import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/bloc/data%20bloc/data_bloc.dart';
import 'package:movie_buzz/bloc/navigation%20bloc/navigation_bloc.dart';
import 'package:movie_buzz/bottom%20navigation%20bar/custom_bottom_nav.dart';
import 'package:movie_buzz/pages/calendar_page.dart';
import 'package:movie_buzz/pages/favourite_page.dart';
import 'package:movie_buzz/pages/home_page.dart';
import 'package:movie_buzz/pages/profile_page.dart';
import 'package:movie_buzz/pages/search_page.dart';
import 'package:movie_buzz/repository/data_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Add this line

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Widget> pages = [
    HomePage(),
    SearchPage(),
    CalendarPage(),
    FavouritePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    final dataRepository = DataRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(create: (_) => NavigationBloc()),
        BlocProvider<DataBloc>(create: (_) => DataBloc(dataRepository)),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          cardTheme: CardTheme(color: Colors.white),
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
          scaffoldBackgroundColor: Colors.white,
        ),

        home: CustomBottomNav(),
      ),
    );
  }
}
