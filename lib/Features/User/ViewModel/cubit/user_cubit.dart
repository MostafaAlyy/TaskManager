import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Core/DataBase/DioHelper/dio_helper.dart';
import 'package:task_manger/Core/DataBase/DioHelper/end_points.dart';
import 'package:task_manger/Features/Auth/ViewModel/AuthCupit/auth_cupit.dart';
import 'package:task_manger/Features/User/Model/user_from_users_model.dart';

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

  void updateUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required int userType,
    required int departmentId,
    required int userId,
  }) {
    DioHelper.postData(
        token: AuthCupit.userData!.token!,
        url: "$updateUserEndpoint$userId",
        data: {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
          'user_type': userType,
          'user_status': 0,
          'department_id': departmentId,
        }).then((value) {
      debugPrint(value.data.toString());
      emit(UpdateUserSuccessState(value.data['message']));
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(UpdateUserErrorState(onError.toString()));
    });
  }

  List<UserFromUsersModel> allUsers = [];
  void getAllUsers() {
    allUsers = [];
    DioHelper.getData(
            url: getAllUsersEndpoint, token: AuthCupit.userData!.token)
        .then((value) {
      for (var element in value.data['data']) {
        allUsers.add(UserFromUsersModel.fromJson(element));
      }
      emit(GetAllUsersSuccessState());
    }).then((value) {
      emit(GetAllUsersErrorState());
    });
  }

  List<UserFromUsersModel> allEmployee = [];
  void getAllEmployee() {
    allEmployee = [];
    DioHelper.getData(
            url: getAllEmployeeEndpoint, token: AuthCupit.userData!.token)
        .then((value) {
      for (var element in value.data['data']) {
        allEmployee.add(UserFromUsersModel.fromJson(element));
      }
      emit(GetAllEmployeesSuccessState());
    }).then((value) {
      emit(GetAllEmployeesErrorState());
    });
  }

  void deleteUser({
    required int userId,
  }) {
    DioHelper.deleteData(
            url: "$deleteUserEndpoint$userId", token: AuthCupit.userData!.token)
        .then((value) {
      emit(DeleteUserSuccessState(value.data['message']));
    }).catchError((onError) {
      emit(DeleteUserErrorState('You can`t delete parent.'));
    });
  }
}
