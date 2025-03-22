import 'package:flutter/material.dart';
import 'package:test_flutter/widgets/webtoon/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => DetailScreen(title: title, thumb: thumb, id: id),
          ),
        );
      },
      child: Column(
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
              thumb,
              // 네이버에서 앱에서 실행하면 막아서 브라우저로 agent 변경
              headers: const {
                "User-Agent":
                    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
              },
            ),
          ),

          SizedBox(height: 10),

          Text(title, style: TextStyle(fontSize: 22)),
        ],
      ),
    );
  }
}
