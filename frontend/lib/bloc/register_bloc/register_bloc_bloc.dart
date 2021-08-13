import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:frontend/data/repo/register_repo.dart';
import 'package:meta/meta.dart';

part 'register_bloc_event.dart';
part 'register_bloc_state.dart';

class RegisterBlocBloc extends Bloc<RegisterBlocEvent, RegisterBlocState> {
  RegisterBlocBloc() : super(RegisterBlocInitial());

  @override
  Stream<RegisterBlocState> mapEventToState(
    RegisterBlocEvent event,
  ) async* {
    if (event is RegisterBeginEvent) {
      yield* registerUser(
          username: event.username,
          email: event.email,
          password: event.password);
    }
  }

  Stream<RegisterBlocState> registerUser(
      {required String username,
      required String email,
      required String password}) async* {
    try {
      yield RegisterLoading();
      RegisterRepository _loginRepo = new RegisterRepository();
      bool status = await _loginRepo.userRegister(username, email, password);
      if (status) {
        yield RegisterSuccess();
      } else {
        yield RegisterFailed(message: "Couldnot register user");
      }
    } catch (e) {
      yield RegisterFailed(message: e.toString());
    }
  }
}
