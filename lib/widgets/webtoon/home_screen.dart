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
            /**
             * ListView를 사용하면 주어진 데이터 모두를 한번에 그림
             * ListView.builder를 사용하면 보여지는 아이템만 그리고 안보이게된 것들은 메모리에서 제거함
             * seperated도 builder와 동일하게 로직탐
             *
             * Column 내부에서 LazyRow를 쓰면 height에 infinity 가 오면서 사이즈 측정 오류가 나옴
             *  따라서 expanded를 통해서 남은 영역을 사용하도록하면 사이즈가 측정되며 에러 해결됨
             */
            return Column(
              children: [SizedBox(height: 50), Expanded(child: makeList(data))],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  ListView makeList(List<WebtoonModel> data) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: Offset(10, 10),
                    color: Colors.black.withValues(alpha: 0.2),
                  ),
                ],
              ),
              child: Image.network(
                data[index].thumbnail,
                // 네이버에서 앱에서 실행하면 막아서 브라우저로 agent 변경
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                },
              ),
            ),

            SizedBox(height: 10),

            Text(data[index].title, style: TextStyle(fontSize: 22)),
          ],
        );
      },
      itemCount: data.length,
      separatorBuilder: (context, index) => SizedBox(width: 40),
    );
  }
}
