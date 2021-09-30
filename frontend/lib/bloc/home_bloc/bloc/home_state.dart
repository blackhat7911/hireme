part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class WorkerLoading extends HomeState {}

class WorkerLoadSuccess extends HomeState {
  final List workers;
  const WorkerLoadSuccess({required this.workers});

  @override
  List<Object> get props => [workers];
}

class WorkerLoadFailed extends HomeState {
  final String message;
  WorkerLoadFailed({required this.message});

  @override
  List<Object> get props => [message];
}
