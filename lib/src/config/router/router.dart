import 'package:flutter/material.dart';

abstract class AppRouter {
  const AppRouter();

  static Map<String, Widget Function(BuildContext)> get routes => {};
}
