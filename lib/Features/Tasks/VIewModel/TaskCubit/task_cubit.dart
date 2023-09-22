import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Core/DataBase/DioHelper/dio_helper.dart';
import 'package:task_manger/Core/DataBase/DioHelper/end_points.dart';
import 'package:task_manger/Features/Auth/ViewModel/AuthCupit/auth_cupit.dart';
import 'package:task_manger/Features/Tasks/Model/task_moudel.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  static TaskCubit get(BuildContext context) => BlocProvider.of(context);

  void addTask({
    required String name,
    required String description,
    required String startDate,
    required String endDate,
    required String employeeId,
  }) {
    DioHelper.postData(
        url: addTaskEndpoint,
        token: AuthCupit.userData!.token,
        data: {
          'name': name,
          'description': description,
          'start_date': startDate,
          'end_date': endDate,
          'employee_id': employeeId,
          'status': "0"
        }).then((value) {
      debugPrint(value.toString());
      emit(AddTaskSuccessState(message: value.data['message']));
    }).catchError((onError) {
      debugPrint(onError.toString());
      AddTaskErrorState(errorMessage: onError.toString());
    });
  }

  List<TaskModel> allTasks = [];
  getAllTasks() {
    emit(GetAllTasksLoadingState());
    allTasks = [];
    DioHelper.getData(
      url: getAllTasksEndpoint,
      token: AuthCupit.userData!.token,
    ).then((value) {
      for (var element in value.data['data']) {
        allTasks.add(TaskModel.fromJson(element));
      }
      emit(GetAllTasksSussesState());
    }).catchError((onError) {
      emit(GetAllTasksErrorState());
    });
  }

  updateTask({required TaskModel task}) {
    DioHelper.postData(
        url: "$updateTasksEndpoint${task.id}",
        token: AuthCupit.userData!.token,
        data: {
          'name': task.name,
          'description': task.description,
          'department_id': task.department!.id,
          'status': statusToInt(task.status!),
          'start_date': task.startDate,
          'end_date': task.endDate,
          'employee_id': task.employee!.id!,
        }).then((value) {
      emit(UpdateTasksSussesState(message: value.data['message']));
    }).catchError((onError) {
      emit(UpdateTasksErrorState(errorMessage: onError.toString()));
    });
  }

  void deleteTask({
    required int taskId,
  }) {
    DioHelper.deleteData(
            url: "$deleteTaskEndpoint$taskId", token: AuthCupit.userData!.token)
        .then((value) {
      emit(UpdateTasksSussesState(message: value.data['message']));
    }).catchError((onError) {
      emit(UpdateTasksErrorState(
          errorMessage: 'Department must be empty to delete'));
    });
  }
}

int statusToInt(String status) {
  switch (status) {
    case 'new':
      return 0;

    case 'processing':
      return 1;

    case 'completed':
      return 2;

    case 'notcompleted':
      return 3;

    case 'canceled':
      return 4;
    case 'expired':
      return 5;

    default:
      return 0;
  }
}
