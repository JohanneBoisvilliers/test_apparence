import 'package:bart/bart/bart_appbar.dart';
import 'package:test_librairies/database/Entities/article.dart';
import 'package:test_librairies/gate/gate_provider.dart';
import 'package:flutter/material.dart';
import 'package:alfreed/alfreed.dart';
import 'package:gate/gate.dart';
import 'package:test_librairies/services/article_service.dart';

part 'first_tab_page.gate_inject.g.part';

class FirstTabViewModel {
  List<Article>? articles;
}

class FirstTabViewInterface extends AlfreedView with AppBarNotifier {
  FirstTabViewInterface(BuildContext context) : super(context: context);

  void showBar(AppBar appBarToShow) {
    updateAppBar(context, appBarToShow);
    showAppBar(context);
  }
}

class FirstTabPage extends AlfreedPage<FirstTabPresenter, FirstTabViewModel, FirstTabViewInterface> {
  FirstTabPage({Object? args, Key? key}) : super(args: args, key: key);

  @override
  AlfreedPageBuilder<FirstTabPresenter, FirstTabViewModel, FirstTabViewInterface> build() {
    return AlfreedPageBuilder(
      key: const ValueKey('presenter'),
      presenterBuilder: (context) => FirstTabPresenter(),
      interfaceBuilder: (context) => FirstTabViewInterface(context),
      builder: (context, presenter, model) => Container(
          color: Colors.white,
          child: FutureBuilder(
              future: presenter.getArticles(),
              builder: ((futureContext, snapshot) {
                if (!snapshot.hasData) {
                  return SizedBox(
                      width: context.device.size.width,
                      height: context.device.size.height,
                      child: const Center(child: CircularProgressIndicator()));
                } else if (snapshot.hasError) {
                  return const Text("oups i did it again!");
                } else {
                  model.articles = (snapshot.data as List<Article>);
                  return ListView.builder(
                    itemCount: model.articles?.length ?? 0,
                    itemBuilder: (BuildContext itemcontext, int index) => GestureDetector(
                      onTap: () => Navigator.of(context.buildContext)
                          .pushNamed('/home/articleDetail', arguments: model.articles![index].title),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${model.articles?[index].section}',
                                style: Theme.of(context.buildContext).textTheme.overline,
                              ),
                              Text(
                                '${model.articles?[index].title}',
                                style: Theme.of(context.buildContext).textTheme.headline6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              }))),
    );
  }
}

@Inject(children: [
  InjectedChild(ArticleService, factoryName: 'build'),
])
class FirstTabPresenter extends Presenter<FirstTabViewModel, FirstTabViewInterface> {
  FirstTabPresenter() : super(state: FirstTabViewModel());

  Future<List<Article>> getArticles() async => await articleService.getArticles();
}
