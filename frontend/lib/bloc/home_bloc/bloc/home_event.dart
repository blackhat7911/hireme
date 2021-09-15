part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeBeginEvent extends HomeEvent {}

class WorkerListLoadEvent extends HomeEvent {}