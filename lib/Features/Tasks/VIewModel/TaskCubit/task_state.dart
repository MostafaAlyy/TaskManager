part of 'task_cubit.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class AddTaskSuccessState extends TaskState {
  String message;
  AddTaskSuccessState({required this.message});
}

final class AddTaskErrorState extends TaskState {
  String errorMessage;
  AddTaskErrorState({required this.errorMessage});
}

final class GetAllTasksLoadingState extends TaskState {}

final class GetAllTasksSussesState extends TaskState {}

final class GetAllTasksErrorState extends TaskState {}

final class UpdateTasksSussesState extends TaskState {
  String message;
  UpdateTasksSussesState({required this.message});
}

final class UpdateTasksErrorState extends TaskState {
  String errorMessage;
  UpdateTasksErrorState({required this.errorMessage});
}
