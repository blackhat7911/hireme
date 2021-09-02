import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:frontend/data/repo/login_repo.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginBeginEvent) {
      yield* loginUser(email: event.username, password: event.password);
    }
  }

  Stream<LoginState> loginUser(
      {required String email, required String password}) async* {
    try {
      yield LoginLoading();
      LoginRepository _loginRepo = new LoginRepository();
      bool status = await _loginRepo.userLogin(email, password);
      if (status == true) {
        yield LoginSuccess();
      } else {
        yield LoginFailed(message: "Invalid Username or password");
      }
    } catch (e) {
      yield LoginFailed(message: e.toString());
    }
  }
}
