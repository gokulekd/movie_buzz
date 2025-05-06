import 'package:flutter/material.dart';
import 'package:movie_buzz/pages/calendar_page.dart';
import 'package:movie_buzz/pages/favourite_page.dart';
import 'package:movie_buzz/pages/home_page.dart';
import 'package:movie_buzz/pages/profile_page.dart';
import 'package:movie_buzz/pages/search_page.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int _selectedIndex = 0;

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

  final List<Widget> pages = [
    HomePage(),
    SearchPage(),
    CalendarPage(),
    FavouritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu, size: 30)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: NotificationBadge(
              icon: Icons.notifications_none_sharp,
              count: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: NotificationBadge(icon: Icons.chat_bubble_outline, count: 2),
          ),
        ],
      ),

      body: pages[_selectedIndex],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_icons.length, (index) {
                final bool isHome = index == 0;
                final bool isSelected = _selectedIndex == index;

                // We'll skip the selected item here and render it separately above
                if (isSelected) return SizedBox(width: 60);

                return GestureDetector(
                  onTap: () => setState(() => _selectedIndex = index),
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
                    _selectedIndex +
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
                      _icons[_selectedIndex],
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    _labels[_selectedIndex],
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
  }
}

class NotificationBadge extends StatelessWidget {
  final IconData icon;
  final int count;

  const NotificationBadge({super.key, required this.icon, required this.count});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Icon(icon, size: 30),
        if (count > 0) // Only show the badge if the count is greater than 0
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.green, // Or any color you prefer
                borderRadius: BorderRadius.circular(8), // Make it circular
              ),
              constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
              child: Center(
                child: Text(
                  '$count',
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
