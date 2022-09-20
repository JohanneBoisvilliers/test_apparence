import 'package:bart/bart.dart';
import 'package:flutter/material.dart';
import 'package:alfreed/alfreed.dart';

class SeconTabViewModel {
  ValueNotifier<int> counter = ValueNotifier(0);
}

class SeconTabViewInterface extends AlfreedView with AppBarNotifier {
  SeconTabViewInterface(BuildContext context) : super(context: context);

  void showBar(AppBar appBarToShow) {
    updateAppBar(context, appBarToShow);
    showAppBar(context);
  }
}

class SeconTabPage extends AlfreedPage<SeconTabPresenter, SeconTabViewModel, SeconTabViewInterface> {
  SeconTabPage({Object? args, Key? key}) : super(args: args, key: key);

  @override
  AlfreedPageBuilder<SeconTabPresenter, SeconTabViewModel, SeconTabViewInterface> build() {
    return AlfreedPageBuilder(
      key: const ValueKey('presenter'),
      presenterBuilder: (context) => SeconTabPresenter(),
      interfaceBuilder: (context) => SeconTabViewInterface(context),
      builder: (context, presenter, model) {
        presenter.view.showBar(AppBar(
          title: const Text('test bar'),
        ));
        return Scaffold(
          body: Container(
            color: Colors.amber,
            child: Center(
                child: ValueListenableBuilder<int>(
              valueListenable: presenter.state.counter,
              builder: (context, value, _) => Text('$value'),
            )),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              presenter.state.counter.value++;
            },
          ),
        );
      },
    );
  }
}

class SeconTabPresenter extends Presenter<SeconTabViewModel, SeconTabViewInterface> {
  SeconTabPresenter() : super(state: SeconTabViewModel());
}
