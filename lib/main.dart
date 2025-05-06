import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/bloc/nav_bloc.dart';
import 'package:movie_buzz/pages/calendar_page.dart';
import 'package:movie_buzz/pages/favourite_page.dart';
import 'package:movie_buzz/pages/home_page.dart';
import 'package:movie_buzz/pages/profile_page.dart';
import 'package:movie_buzz/pages/search_page.dart';
import 'package:movie_buzz/widgets/custom_bottom_nav.dart';

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
    return BlocProvider(
      create: (_) => NavBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          cardTheme: CardTheme(color: Colors.white),
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
          scaffoldBackgroundColor: Colors.white,
        ),

        home: const CustomBottomNav(),
      ),
    );
  }
}
