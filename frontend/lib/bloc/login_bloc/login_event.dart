part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginBeginEvent extends LoginEvent {
  final String username;
  final String password;
  LoginBeginEvent({required this.username, required this.password});
}

class LoginSubmited extends LoginEvent {}
