class Article {
  final int? id;
  final String? title;
  final String? section;

  Article({this.id, this.title, this.section});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      section: json['section'],
    );
  }
}
