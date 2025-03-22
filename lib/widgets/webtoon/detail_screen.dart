import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 2,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /**
               *  Hero는 하나의 이미지가 이동해서 보여지는 것처럼 애니메이션을 컨트롤해줌
               *  태그 매칭
               */
              Hero(
                tag: id,
                child: Container(
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
                    thumb,
                    // 네이버에서 앱에서 실행하면 막아서 브라우저로 agent 변경
                    headers: const {
                      "User-Agent":
                          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
