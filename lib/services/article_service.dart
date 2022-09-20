import 'package:test_librairies/database/Entities/article.dart';
import 'package:test_librairies/database/Repositories/articles_repository.dart';
import 'package:test_librairies/gate/gate_provider.dart';
import 'package:gate/gate.dart';

part 'article_service.gate_inject.g.part';

@Injectable()
@Inject(children: [
  InjectedChild(ArticlesRepository, factoryName: 'build'),
])
class ArticleService {
  ArticleService._();

  @Provide()
  factory ArticleService.build() => ArticleService._();

  Future<List<Article>> getArticles() async => articlesRepository.getArticles();
}
