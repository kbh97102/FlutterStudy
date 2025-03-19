import 'package:flutter/material.dart';
import 'package:test_flutter/service/api_service.dart';
import 'package:test_flutter/widgets/models/webtoon_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    waitForWebToons();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Container(child: TextButton(onPressed: () {}, child: Text("test"))),
    );
  }

  void waitForWebToons() async {
    webtoons = await ApiSerivce.getTodayToons();
    isLoading = false;
    setState(() {});
  }
}
