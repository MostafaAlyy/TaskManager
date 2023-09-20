part of 'department_cubit.dart';

@immutable
sealed class DepartmentState {}

final class DepartmentInitial extends DepartmentState {}

final class GetAllDepartmentsLLoadingState extends DepartmentState {}

final class GetAllDepartmentsSuccessState extends DepartmentState {}

final class GetAllDepartmentsErrorState extends DepartmentState {}

final class AddDepartmentsSuccessState extends DepartmentState {
  String message;
  AddDepartmentsSuccessState(this.message);
}

final class AddDepartmentsErrorState extends DepartmentState {
  String error;
  AddDepartmentsErrorState(this.error);
}

final class UpdateDepartmentsSuccessState extends DepartmentState {
  String message;
  UpdateDepartmentsSuccessState(this.message);
}

final class UpdateDepartmentsErrorState extends DepartmentState {
  String error;
  UpdateDepartmentsErrorState(this.error);
}

final class ChangeDropDownValueState extends DepartmentState {}
