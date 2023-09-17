// ignore_for_file: use_key_in_widget_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_manger/Core/DataBase/DioHelper/dio_helper.dart';
import 'package:task_manger/Features/Auth/Model/user_model.dart';
import 'package:task_manger/Features/Auth/View/Pages/Temp_page.dart';
import 'package:task_manger/Features/Auth/View/Pages/login_page.dart';
import 'package:task_manger/Features/Auth/ViewModel/AuthCupit/auth_cupit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? userDataString;
  Widget widget = const LoginScreen();

  await storage.read(key: 'userDataString').then((value) {
    userDataString = value;
  });
  if (userDataString != null) {
    widget = const TempPage();
    AuthCupit.userData = UserModel.fromJson(json.decode(userDataString!));
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
