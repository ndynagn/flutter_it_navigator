import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/screens/news_list/view/news_list_screen.dart';

abstract class AppRouter {
  const AppRouter();

  static Map<String, Widget Function(BuildContext)> get routes => {
    '/': (context) => const NewsListScreen(),
  };
}
