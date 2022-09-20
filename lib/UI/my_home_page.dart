import 'package:bart/bart.dart';
import 'package:flutter/material.dart';
import 'package:test_librairies/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BartScaffold(
      routesBuilder: subRoutes, // add a reference to the subRoutes list you created before
      bottomBar: BartBottomBar.adaptive(), // add the bottom bar (see below for other options)
    );
  }
}
