part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class AddUserSuccessState extends UserState {
  String message;
  AddUserSuccessState(this.message);
}

final class AddUserErrorState extends UserState {
  String error;
  AddUserErrorState(this.error);
}

final class UpdateUserSuccessState extends UserState {
  String message;
  UpdateUserSuccessState(this.message);
}

final class UpdateUserErrorState extends UserState {
  String error;
  UpdateUserErrorState(this.error);
}

final class GetAllUsersSuccessState extends UserState {}

final class GetAllUsersErrorState extends UserState {}
