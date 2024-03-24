import 'package:flutter/material.dart';
import '../common/bottomnav.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formula One Standings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Formula One Standings!',
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              'Powered by Ergast API',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavApp(),
    );
  }
}
