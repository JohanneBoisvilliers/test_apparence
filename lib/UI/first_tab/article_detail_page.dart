import 'package:bart/bart/bart_appbar.dart';
import 'package:flutter/material.dart';
import 'package:alfreed/alfreed.dart';

class ArticleDetailViewModel {}

class ArticleDetailViewInterface extends AlfreedView with AppBarNotifier {
  ArticleDetailViewInterface(BuildContext context) : super(context: context);

  void showBar(AppBar appBarToShow) {
    updateAppBar(context, appBarToShow);
    showAppBar(context);
  }
}

class ArticleDetailPage
    extends AlfreedPage<ArticleDetailPresenter, ArticleDetailViewModel, ArticleDetailViewInterface> {
  ArticleDetailPage({Object? args, Key? key}) : super(args: args, key: key);

  @override
  AlfreedPageBuilder<ArticleDetailPresenter, ArticleDetailViewModel, ArticleDetailViewInterface> build() {
    return AlfreedPageBuilder(
      key: const ValueKey('presenter'),
      presenterBuilder: (context) => ArticleDetailPresenter(),
      interfaceBuilder: (context) => ArticleDetailViewInterface(context),
      builder: (context, presenter, model) {
        presenter.view.showBar(AppBar(
          title: const Text('app bar nested'),
        ));

        return Container(
          color: Colors.amber,
          child: Center(
            child: Text('bleble :${args as String}'),
          ),
        );
      },
    );
  }
}

class ArticleDetailPresenter extends Presenter<ArticleDetailViewModel, ArticleDetailViewInterface> {
  ArticleDetailPresenter() : super(state: ArticleDetailViewModel());
}
