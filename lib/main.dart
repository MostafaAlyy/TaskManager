// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:task_manger/Core/DataBase/DioHelper/dio_helper.dart';
import 'package:task_manger/Features/Auth/View/Pages/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      title: 'Task Manager',
      home: const LoginScreen(),
    );
  }
}
