import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/bloc/navigation%20bloc/navigation_bloc.dart';
import 'package:movie_buzz/bloc/navigation%20bloc/navigation_event.dart';
import 'package:movie_buzz/bloc/navigation%20bloc/navigation_state.dart';
import 'package:movie_buzz/common/notification_badge_widget.dart';
import 'package:movie_buzz/pages/calendar_page.dart';
import 'package:movie_buzz/pages/favourite_page.dart';
import 'package:movie_buzz/pages/home_page.dart';
import 'package:movie_buzz/pages/profile_page.dart';
import 'package:movie_buzz/pages/search_page.dart';

class CustomBottomNav extends StatelessWidget {
  CustomBottomNav({super.key});

  final List<IconData> _icons = [
    Icons.home_filled,
    Icons.search,
    Icons.calendar_month_outlined,
    Icons.favorite_border,
    Icons.person,
  ];

  final List<String> _labels = [
    'Home',
    'Search',
    'Calendar',
    'Favourite',
    'Profile',
  ];

  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    CalendarPage(),
    FavouritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu, size: 30),
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: NotificationBadgeWidget(
                    icon: Icons.notifications_none_sharp,
                    count: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: NotificationBadgeWidget(
                    icon: Icons.chat_bubble_outline,
                    count: 2,
                  ),
                ),
              ],
            ),
            body: _pages[state.selectedIndex],
            bottomNavigationBar: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 5),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(_icons.length, (index) {
                      final bool isHome = index == 0;
                      final bool isSelected = state.selectedIndex == index;

                      // We'll skip the selected item here and render it separately above
                      if (isSelected) return SizedBox(width: 60);

                      return GestureDetector(
                        onTap:
                            () => context.read<NavigationBloc>().add(
                              NavigateToTab(index),
                            ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _icons[index],
                              size: 24,
                              color: isHome ? Colors.green : Colors.black,
                            ),
                            SizedBox(height: 4),
                            Text(
                              _labels[index],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: isHome ? Colors.green : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
                // Floating Selected Item
                Positioned(
                  top: -25,
                  left:
                      MediaQuery.of(context).size.width /
                          _icons.length *
                          state.selectedIndex +
                      MediaQuery.of(context).size.width / _icons.length / 2 -
                      35,
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 6),
                            ],
                          ),
                          child: Icon(
                            _icons[state.selectedIndex],
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          _labels[state.selectedIndex],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
