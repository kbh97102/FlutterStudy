import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_flutter/widgets/models/webtoon_detail_model.dart';
import 'package:test_flutter/widgets/models/webtoon_episode_model.dart';
import 'package:test_flutter/widgets/models/webtoon_model.dart';

class ApiSerivce {
  static const baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const todayEndpoint = "today";

  static Future<List<WebtoonModel>> getTodayToons() async {
    final webtoonList = <WebtoonModel>[];
    final response = await http.get(Uri.parse("$baseUrl/$todayEndpoint"));

    if (response.statusCode == 200) {
      final List<dynamic> list = jsonDecode(response.body);

      for (final webtoon in list) {
        webtoonList.add(WebtoonModel.fromJson(webtoon));
      }
    }
    return webtoonList;
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
    String id,
  ) async {
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      List<WebtoonEpisodeModel> list = [];

      for (var episode in episodes) {
        list.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return list;
    }
    throw Error();
  }
}
