import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Core/DataBase/DioHelper/dio_helper.dart';
import 'package:task_manger/Core/DataBase/DioHelper/end_points.dart';
import 'package:task_manger/Features/Auth/Model/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
part 'auth_state.dart';

class AuthCupit extends Cubit<AuthState> {
  AuthCupit() : super(AuthInitial());
  static AuthCupit get(BuildContext context) => BlocProvider.of(context);
  static UserModel? userData;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  void login(String email, String password, bool keepMeLogin) {
    DioHelper.postData(
        url: loginEndPoint,
        data: {'email': email, 'password': password}).then((value) {
      userData = UserModel.fromJson(value.data['data']);
      if (keepMeLogin) {
        String userDataString = json.encode((userData!.toJson()));
        storage.write(
            key: 'userDataString', value: json.encode((userDataString)));
      }
      emit(AuthLoginSuccessState(message: value.data['message']));
    }).catchError((onError) {
      emit(AuthLoginErrorState(errorMessage: onError.toString()));
    });
  }

  void logout() {
    DioHelper.postData(url: logoutEndPoint, data: {'token': userData!.token})
        .then((value) {
      userData = null;
      storage.delete(
        key: 'userDataString',
      );
      //emit(AuthLogOutSuccessState());
    }).catchError((onError) {
      emit(AuthLogOutErrorState());
    });
  }
}
