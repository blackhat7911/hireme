part of 'register_bloc_bloc.dart';

@immutable
abstract class RegisterBlocState {}

class RegisterBlocInitial extends RegisterBlocState {}

class RegisterInitial extends RegisterBlocState {}

class RegisterLoading extends RegisterBlocState {}

class RegisterSuccess extends RegisterBlocState {
  
}

class RegisterFailed extends RegisterBlocState {
  final String message;
  RegisterFailed({required this.message});
  List<Object?> get props => [message];
}
