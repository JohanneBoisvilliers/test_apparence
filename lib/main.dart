import 'package:flutter/material.dart';
import 'package:test_librairies/UI/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: routes,
    );
  }
}

Route<dynamic> routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (_) => const HomePage(),
      );
    case '/other':
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: Text('Test page'),
          ),
        ),
      );
    default:
      throw 'unexpected Route';
  }
}
