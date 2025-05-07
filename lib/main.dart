import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/core/network/api_client.dart';
import 'package:movie_buzz/logic/data_bloc/data_bloc.dart';
import 'package:movie_buzz/logic/navigation_bloc/navigation_bloc.dart';
import 'package:movie_buzz/presentation/components/bottom_navigation_bar/custom_bottom_nav.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Add this line

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dataRepository = ApiClient();

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
