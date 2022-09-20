import 'package:animations/animations.dart';
import 'package:bart/bart.dart';
import 'package:flutter/material.dart';
import 'package:test_librairies/UI/first_tab/article_detail_page.dart';
import 'package:test_librairies/UI/first_tab/first_tab_page.dart';
import 'package:test_librairies/UI/second_tab/second_tab_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future appPushNamed(String route, {Object? arguments}) =>
    navigatorKey.currentState!.pushNamed(route, arguments: arguments);

      List<BartMenuRoute> subRoutes() {
    return [
      BartMenuRoute.bottomBar(
        label: "Home",
        icon: Icons.home,
        path: '/home',
        pageBuilder: (parentContext, tabContext, settings) => FirstTabPage(
          key: const PageStorageKey<String>("home"),
        ),
        transitionDuration: bottomBarTransitionDuration,
        transitionsBuilder: bottomBarTransition,
      ),
      BartMenuRoute.bottomBar(
        label: "Counter",
        icon: Icons.video_library_rounded,
        path: '/counter',
        pageBuilder: (parentContext, tabContext, settings) => SeconTabPage(
          key: const PageStorageKey<String>("counter"),
        ),
        transitionDuration: bottomBarTransitionDuration,
        transitionsBuilder: bottomBarTransition,
      ),
      BartMenuRoute.bottomBar(
        label: "Profile",
        icon: Icons.person,
        path: '/profile',
        pageBuilder: (parentContext, tabContext, settings) =>
            Container(key: const PageStorageKey<String>("profile"), child: const Center(child: Text('Profile page'))),
        transitionDuration: bottomBarTransitionDuration,
        transitionsBuilder: bottomBarTransition,
      ),
      BartMenuRoute.innerRoute(
        path: "/home/articleDetail",
        pageBuilder: (parentContext, tabContext, settings) => ArticleDetailPage(args: settings?.arguments),
      ),
    ];
  }

  Widget bottomBarTransition(
  BuildContext c,
  Animation<double> a1,
  Animation<double> a2,
  Widget child,
) =>
    FadeThroughTransition(
      animation: a1,
      secondaryAnimation: a2,
      fillColor: Colors.white,
      child: child,
    );

const bottomBarTransitionDuration = Duration(milliseconds: 700);