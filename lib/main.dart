import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/app.dart';
import 'package:get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: 'https://5492-217-25-210-182.ngrok-free.app/',
      ),
    ),
  );

  runApp(const App());
}
