import 'package:http/http.dart' as http;

class ApiSerivce {
  final baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final todayEndpoint = "today";

  void getTodayToons() async {
    final response = await http.get(Uri.parse("$baseUrl/$todayEndpoint"));

    print(">>>>TEST ${response.body}");
  }
}
