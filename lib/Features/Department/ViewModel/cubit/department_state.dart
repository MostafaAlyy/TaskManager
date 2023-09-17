part of 'department_cubit.dart';

@immutable
sealed class DepartmentState {}

final class DepartmentInitial extends DepartmentState {}

final class GetAllDepartmentsSuccessState extends DepartmentState {}

final class GetAllDepartmentsErrorState extends DepartmentState {}

final class AddDepartmentsSuccessState extends DepartmentState {}

final class AddDepartmentsErrorState extends DepartmentState {}

final class UpdateDepartmentsSuccessState extends DepartmentState {}

final class UpdateDepartmentsErrorState extends DepartmentState {}

final class ChangeDropDownValueState extends DepartmentState {}
