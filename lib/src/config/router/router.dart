import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/screens/filters/filters_screen.dart';
import 'package:flutter_it_navigator/src/screens/main_wrapper/main_wrapper_screen.dart';

abstract class AppRouter {
  const AppRouter();

  static Map<String, Widget Function(BuildContext)> get routes => {
    '/': (context) => MainWrapperScreen(),
    '/filters': (context) => FiltersScreen(),
  };
}
