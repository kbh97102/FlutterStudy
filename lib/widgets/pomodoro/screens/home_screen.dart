import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TODO: 자바의 스태틱과 같은건가 설마?
  static const _defaultSeconds = 1500;
  int totalSeconds = _defaultSeconds;
  bool isRunning = false;
  int totalPomodoros = 0;

  // TODO: lazy init 과연 안전한가? 어떻게 체크할 수 있을까?
  late Timer timer;

  void onTick() {
    if (totalSeconds == 0) {
      setState(() {
        isRunning = false;
        totalPomodoros += 1;
        totalSeconds = _defaultSeconds;
      });
      timer.cancel();

      return;
    }
    setState(() {
      totalSeconds -= 1;
    });
  }

  void onStartPressed() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      onTick();
    });
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    setState(() {
      totalSeconds = _defaultSeconds;
    });
  }

  String format(int seconds) {
    return Duration(
      seconds: seconds,
    ).toString().split('.').first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData localTheme = Theme.of(context);
    return Scaffold(
      backgroundColor: localTheme.scaffoldBackgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: localTheme.cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: Column(
                children: [
                  IconButton(
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Icon(
                      isRunning
                          ? Icons.pause_circle_outline_outlined
                          : Icons.play_circle_outline_outlined,
                    ),
                    iconSize: 120,
                    color: localTheme.cardColor,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: IconButton(
                      onPressed: onResetPressed,
                      icon: Icon(Icons.change_circle_outlined),
                      iconSize: 80,
                      color: localTheme.cardColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: localTheme.cardColor,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodoros",
                          style: TextStyle(
                            fontSize: 20,
                            color:
                                localTheme.textTheme.headlineLarge?.color ??
                                Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "$totalPomodoros",
                          style: TextStyle(
                            fontSize: 58,
                            color:
                                localTheme.textTheme.headlineLarge?.color ??
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
