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
