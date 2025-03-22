class WebtoonDetailModel {
  final String title;
  final String genre;
  final String id;
  final String age;

  WebtoonDetailModel({
    required this.title,
    required this.genre,
    required this.id,
    required this.age,
  });

  factory WebtoonDetailModel.fromJson(Map<String, dynamic> json) {
    return WebtoonDetailModel(
      title: json['title'],
      genre: json['genre'],
      id: json['id'],
      age: json['age'],
    );
  }
}
