import 'package:flutter/material.dart';
import 'package:test_flutter/service/api_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiSerivce();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "오늘의 웹툰",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 2,
        centerTitle: true,
      ),
      body: Container(
        child: TextButton(
          onPressed: () {
            apiService.getTodayToons();
          },
          child: Text("test"),
        ),
      ),
    );
  }
}
