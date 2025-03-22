class WebtoonEpisodeModel {
  final String date;
  final String id;
  final String title;
  final String rating;

  WebtoonEpisodeModel({
    required this.date,
    required this.id,
    required this.title,
    required this.rating,
  });

  factory WebtoonEpisodeModel.fromJson(Map<String, dynamic> json) {
    return WebtoonEpisodeModel(
      date: json['date'],
      id: json['id'],
      title: json['title'],
      rating: json['rating'],
    );
  }
}
