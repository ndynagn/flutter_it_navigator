import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/config/router/router.dart';
import 'package:flutter_it_navigator/src/config/themes/themes.dart';
import 'package:flutter_it_navigator/src/screens/main_wrapper/main_wrapper_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.light,
      debugShowCheckedModeBanner: false,
      routes: AppRouter.routes,
      home: const MainWrapperScreen(),
    );
  }
}
