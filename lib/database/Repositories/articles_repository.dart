import 'dart:convert';

import 'package:gate/gate.dart';
import 'package:test_librairies/database/Entities/article.dart';
import 'package:http/http.dart' as http;

@Injectable()
class ArticlesRepository {
  ArticlesRepository._();

  @Provide()
  factory ArticlesRepository.build() => ArticlesRepository._();

  Future<List<Article>> getArticles() async {
    var url = Uri.https(
        "api.nytimes.com", "/svc/mostpopular/v2/viewed/7.json", {'api-key': 'xxIt20PcsFOX5uTwQRZnUpeiYzaDRz7O'});
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    List<Article> articleList = [];
    data['results'].forEach((article) => articleList.add(Article.fromJson(article)));

    return articleList;
  }
}
