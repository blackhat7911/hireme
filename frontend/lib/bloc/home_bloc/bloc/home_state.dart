part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class WorkerLoading extends HomeState {}

class WorkerLoadSuccess extends HomeState {}

class WorkerLoadFailed extends HomeState {
  final String message;
  WorkerLoadFailed({required this.message});
  List<Object?> get props => [message];
}
