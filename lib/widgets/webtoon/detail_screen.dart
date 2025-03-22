import 'package:flutter/material.dart';
import 'package:test_flutter/service/api_service.dart';
import 'package:test_flutter/widgets/models/webtoon_detail_model.dart';
import 'package:test_flutter/widgets/models/webtoon_episode_model.dart';

import 'episode.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  // Stateless에서는 여기서는 프로퍼티에 접근이 불가능함
  // Future<WebtoonDetailModel> webtoon = ApiSerivce.getToonById(id);

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  /**
   * Stateless가 아닌 statefull로 한 이유는 initState를 사용하기 위함
   * 위에서 widget.id 같은 프로퍼티에 접근이 불가능함
   */
  @override
  void initState() {
    super.initState();

    webtoon = ApiSerivce.getToonById(widget.id);
    episodes = ApiSerivce.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 2,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /**
                   *  Hero는 하나의 이미지가 이동해서 보여지는 것처럼 애니메이션을 컨트롤해줌
                   *  태그 매칭
                   */
                  Hero(
                    tag: widget.id,
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
                        widget.thumb,
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
              const SizedBox(height: 25),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 15,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "${snapshot.data!.genre} / ${snapshot.data!.age}",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
              const SizedBox(height: 25),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final episodes = snapshot.data ?? List.empty();
                    return Column(
                      spacing: 10,
                      children: [
                        for (var episode in episodes)
                          Episode(episode: episode, webtoonId: widget.id),
                      ],
                    );
                  }

                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
