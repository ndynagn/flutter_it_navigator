import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/config/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRouter.routes,
    );
  }
}
