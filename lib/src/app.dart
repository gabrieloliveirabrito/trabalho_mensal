import 'package:flutter/material.dart';
import 'views/index.dart';

class Application extends StatelessWidget {
  late final Map<String, Widget Function(BuildContext, {Object? args})> _routes;

  Application({Key? key}) : super(key: key) {
    _routes = {for (var route in getRoutes()) route.path: route.view};
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        final route = _routes[settings.name];

        if (route == null) {
          return MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Text('Invalid route path!'),
            ),
            settings: settings,
          );
        } else {
          return MaterialPageRoute(
            builder: (context) => route(context, args: settings.arguments),
            settings: settings,
          );
        }
      },
      themeMode: ThemeMode.system,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.purple,
        appBarTheme: const AppBarTheme(
          color: Colors.purple,
        ),
      ),
    );
  }
}
