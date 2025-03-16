import 'package:flutter/material.dart';

class PomodoroRoot extends StatelessWidget {
  const PomodoroRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFE7626C),
        textTheme: TextTheme(
          headlineLarge: TextStyle(color: Color(0xFF232B55)),
        ),
        cardColor: Color(0xFFF4EDDB),
      ),
      home: Text("data"),
    );
  }
}
