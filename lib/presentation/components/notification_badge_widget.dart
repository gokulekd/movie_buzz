import 'package:flutter/material.dart';

class NotificationBadgeWidget extends StatelessWidget {
  final IconData icon;
  final int count;

  const NotificationBadgeWidget({
    super.key,
    required this.icon,
    required this.count,
  });

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
