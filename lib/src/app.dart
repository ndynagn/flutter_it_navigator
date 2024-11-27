import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_it_navigator/src/config/router/router.dart';
import 'package:flutter_it_navigator/src/config/themes/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return MaterialApp(
      theme: AppThemes.light,
      debugShowCheckedModeBanner: false,
      routes: AppRouter.routes,
    );
  }
}
