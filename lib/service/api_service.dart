import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_flutter/widgets/models/webtoon_model.dart';

class ApiSerivce {
  final baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final todayEndpoint = "today";

  Future<List<WebtoonModel>> getTodayToons() async {
    final webtoonList = <WebtoonModel>[];
    final response = await http.get(Uri.parse("$baseUrl/$todayEndpoint"));

    if (response.statusCode == 200) {
      final List<dynamic> list = jsonDecode(response.body);

      for (final webtoon in list) {
        webtoonList.add(WebtoonModel.fromJson(webtoon));
      }
    }

    webtoonList.forEach((info) => print(info));

    return webtoonList;
  }
}
