import 'dart:convert';

import 'package:frontend/models/login_model.dart';
import 'package:frontend/utils/constants/api_constants.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  final String apiUrl = ApiConstants.baseUrl + ApiConstants.loginUrl;

  Future userLogin(String username, String password) async {
    Uri apiUri = Uri.parse("https://192.168.1.65:8000/user/login/");
    var response = await http
        .post(apiUri, body: {"username": username, "password": password});
    var result = json.decode(response.body);

    print(result);
  }

  Future<void> saveUser(Login login) async {
    Hive.box('login').add(login);
    print(login);
  }
}
