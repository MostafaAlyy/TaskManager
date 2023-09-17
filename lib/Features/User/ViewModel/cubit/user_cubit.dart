import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Core/DataBase/DioHelper/dio_helper.dart';
import 'package:task_manger/Core/DataBase/DioHelper/end_points.dart';
import 'package:task_manger/Features/Auth/ViewModel/AuthCupit/auth_cupit.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  static UserCubit get(BuildContext context) => BlocProvider.of(context);

  void addUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required int userType,
  }) {
    DioHelper.postData(
        token: AuthCupit.userData!.token!,
        url: addUserEndpoint,
        data: {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
          'user_type': userType,
        }).then((value) {
      debugPrint(value.data.toString());
      emit(AddUserSuccessState(value.data['message']));
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(AddUserErrorState(onError.toString()));
    });
  }
}
