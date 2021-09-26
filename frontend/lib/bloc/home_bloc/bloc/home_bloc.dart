import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:frontend/data/repo/home_repo.dart';
import 'package:meta/meta.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeBeginEvent) {
      yield* getWorkerList();
    }
  }

  Stream<HomeState> getWorkerList() async* {
    try {
      yield WorkerLoading();
      HomeRepository _homeRepo = new HomeRepository();
      _homeRepo.getWorkerList();
    } catch (e) {
      yield WorkerLoadFailed(message: e.toString());
    }
  }
}
