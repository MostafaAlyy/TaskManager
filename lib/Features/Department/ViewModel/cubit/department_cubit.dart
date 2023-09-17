import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Core/DataBase/DioHelper/dio_helper.dart';
import 'package:task_manger/Core/DataBase/DioHelper/end_points.dart';
import 'package:task_manger/Features/Auth/ViewModel/AuthCupit/auth_cupit.dart';
import 'package:task_manger/Features/Department/Model/department_model.dart';

part 'department_state.dart';

class DepartmentCubit extends Cubit<DepartmentState> {
  DepartmentCubit() : super(DepartmentInitial());
  static DepartmentCubit get(BuildContext context) => BlocProvider.of(context);
  changeDropDownValue() {
    emit(ChangeDropDownValueState());
  }

  List<Department> departments = [];
  void getAllDepartment() {
    departments = [];
    DioHelper.getData(
            url: getAllDepartmentEndpoint, token: AuthCupit.userData!.token!)
        .then((value) {
      for (var element in value.data['data']) {
        departments.add(Department.fromJson(element));
      }
      emit(GetAllDepartmentsSuccessState());
    }).catchError((onError) {
      emit(GetAllDepartmentsErrorState());
    });
  }

  void addDepartment(String departmentName) {
    DioHelper.postData(
            url: addDepartmentEndpoint,
            data: {'name': departmentName},
            token: AuthCupit.userData!.token)
        .then((value) {
      debugPrint(value.toString());
      emit(AddDepartmentsSuccessState());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(AddDepartmentsErrorState());
    });
  }

  List<Manager> mangers = [];
  void getAllManagers() {
    mangers = [];
    DioHelper.getData(
            url: getManagersEndPoint, token: AuthCupit.userData!.token!)
        .then((value) {
      for (var element in value.data['data']) {
        mangers.add(Manager.fromJson(element));
      }
      print(value.data.toString());
      emit(GetAllDepartmentsSuccessState());
    }).catchError((onError) {
      emit(GetAllDepartmentsErrorState());
    });
  }

  void updateDepartment(String name, int managerId) {
    DioHelper.postData(
        url: updateDepartmentEndpoint,
        token: AuthCupit.userData!.token!,
        data: {'name': name, 'manager_id': managerId}).then((value) {
      debugPrint(value.data.toString());
      emit(UpdateDepartmentsSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(UpdateDepartmentsErrorState());
    });
  }
}
