// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_manger/Core/DataBase/DioHelper/dio_helper.dart';
import 'package:task_manger/Features/Auth/View/Pages/Temp_page.dart';
import 'package:task_manger/Features/Auth/View/Pages/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? token;

  storage.read(key: 'token').then((value) {
    token = value;
  });
  Widget widget = const LoginScreen();
  if (token != null) {
    widget = const TempPage();
  }
  return runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  Widget widget;
  MyApp(this.widget);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      title: 'Task Manager',
      home: widget,
    );
  }
}
