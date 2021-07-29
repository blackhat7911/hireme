part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailed extends LoginState {
  final String message;
  LoginFailed({required this.message});
  List<Object?> get props => [message];
}

class LoginSuccess extends LoginState {}
