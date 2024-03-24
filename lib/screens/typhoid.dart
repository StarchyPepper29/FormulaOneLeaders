import 'package:flutter/material.dart';

class TyphoidScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Haha Lol'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'bro.png',
              width: 200, // Adjust the width as needed
            ),
            SizedBox(height: 20),
            Text(
              'Typhoid',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
