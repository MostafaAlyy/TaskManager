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
    emit(GetAllDepartmentsLLoadingState());
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
      emit(AddDepartmentsSuccessState(value.data['message']));
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(AddDepartmentsErrorState(onError.toString()));
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

  void updateDepartment(String name, int managerId, int departmentID) {
    DioHelper.postData(
        url: "$updateDepartmentEndpoint$departmentID",
        token: AuthCupit.userData!.token!,
        data: {'name': name, 'manager_id': managerId}).then((value) {
      debugPrint(value.data.toString());
      emit(UpdateDepartmentsSuccessState(value.data['message']));
    }).catchError((onError) {
      print(onError.toString());
      emit(UpdateDepartmentsErrorState(onError.toString()));
    });
  }

  void deleteDepartment({
    required int departmentId,
  }) {
    DioHelper.deleteData(
            url: "$deleteDepartmentEndpoint$departmentId",
            token: AuthCupit.userData!.token)
        .then((value) {
      emit(UpdateDepartmentsSuccessState(value.data['message']));
    }).catchError((onError) {
      emit(UpdateDepartmentsErrorState('Department must be empty to delete'));
    });
  }
}
