part of 'register_bloc_bloc.dart';

@immutable
abstract class RegisterBlocEvent {}

class RegisterBeginEvent extends RegisterBlocEvent {
  final String username;
  final String email;
  final String password;
  RegisterBeginEvent({required this.username, required this.email, required this.password});
}

class RegisterSubmittedEvent extends RegisterBlocEvent {}
