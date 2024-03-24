import 'package:flutter/material.dart';
import 'screens/homescreen.dart';
import 'screens/standings.dart';

void main() {
  runApp(WhatWillYouGetEatingOutAtLahore());
}

class WhatWillYouGetEatingOutAtLahore extends StatelessWidget {
  const WhatWillYouGetEatingOutAtLahore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => HomeScreen(),
        "/standings": (context) => Standings()
      },
      initialRoute: "/",
    );
  }
}
