class WebtoonModel {
  final String title, thumbnail, id;

  WebtoonModel({
    required this.title,
    required this.thumbnail,
    required this.id,
  });

  WebtoonModel.fromJson(Map<String, dynamic> json)
    : title = json["title"],
      thumbnail = json["thumb"],
      id = json["id"];

  @override
  String toString() {
    return 'WebtoonModel{title: $title, thumbnail: $thumbnail, id: $id}';
  }
}
