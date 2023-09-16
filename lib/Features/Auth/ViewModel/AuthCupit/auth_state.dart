part of 'auth_cupit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoginSuccessState extends AuthState {
  String message;
  AuthLoginSuccessState({required this.message});
}

final class AuthLoginErrorState extends AuthState {
  String errorMessage;
  AuthLoginErrorState({required this.errorMessage});
}

final class AuthLogOutSuccessState extends AuthState {}

final class AuthLogOutErrorState extends AuthState {}
