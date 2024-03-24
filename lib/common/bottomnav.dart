import 'package:flutter/material.dart';

class bottomNavApp extends StatelessWidget {
  const bottomNavApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.stars),
          label: 'Standings',
        ),
      ],
      onTap: (int index) {
        if (index == 0) {
          Navigator.pushNamed(context, '/');
        } else {
          Navigator.pushNamed(context, '/standings');
        }
      },
    );
  }
}
