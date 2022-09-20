// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:test_librairies/database/Repositories/articles_repository.dart'
    as _i1;
import 'package:test_librairies/services/article_service.dart' as _i2;

// ********************************
// Gate AppProvider generated file
// Do not modify by hand
// ********************************
class AppProvider {
  AppProvider._();

  static final AppProvider instance = AppProvider._();

// ArticlesRepository mock
  _i1.ArticlesRepository? _articlesRepositoryBuildMock;

// ArticleService mock
  _i2.ArticleService? _articleServiceBuildMock;

// injected ArticlesRepository
  _i1.ArticlesRepository getArticlesRepositoryBuild() =>
      _articlesRepositoryBuildMock ?? _i1.ArticlesRepository.build();
// Set ArticlesRepository mock
  void setArticlesRepositoryBuildMock(_i1.ArticlesRepository? mock) =>
      _articlesRepositoryBuildMock = mock;
// injected ArticleService
  _i2.ArticleService getArticleServiceBuild() =>
      _articleServiceBuildMock ?? _i2.ArticleService.build();
// Set ArticleService mock
  void setArticleServiceBuildMock(_i2.ArticleService? mock) =>
      _articleServiceBuildMock = mock;
}

final AppProvider appProvider = AppProvider.instance;
