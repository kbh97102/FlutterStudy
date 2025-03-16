import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData _localTheme = Theme.of(context);
    return Scaffold(
      backgroundColor: _localTheme.scaffoldBackgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "25:00",
                style: TextStyle(
                  color: _localTheme.cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.play_circle_outline_outlined),
                iconSize: 120,
                color: _localTheme.cardColor,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: _localTheme.cardColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodoros",
                          style: TextStyle(
                            fontSize: 20,
                            color:
                                _localTheme.textTheme.headlineLarge?.color ??
                                Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                            fontSize: 58,
                            color:
                                _localTheme.textTheme.headlineLarge?.color ??
                                Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
