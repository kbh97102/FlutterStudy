import 'package:flutter/material.dart';
import 'package:test_flutter/service/api_service.dart';
import 'package:test_flutter/widgets/models/webtoon_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiSerivce.getTodayToons();

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
      /**
       * Stateful위젯을 사용하지 않고 데이터를 호출해 state변경 감지 가능한 widget
       * 내부적으로 stateful widget으로 future await을 대신 처리해줌
       */
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data ?? List.empty();
            print(data);
            /**
             * ListView를 사용하면 주어진 데이터 모두를 한번에 그림
             * ListView.builder를 사용하면 보여지는 아이템만 그리고 안보이게된 것들은 메모리에서 제거함
             * seperated도 builder와 동일하게 로직탐
             */
            return ListView.separated(
              itemBuilder: (context, index) {
                return Text(data[index].title);
              },
              itemCount: data.length,
              separatorBuilder: (context, index) => SizedBox(height: 20),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
