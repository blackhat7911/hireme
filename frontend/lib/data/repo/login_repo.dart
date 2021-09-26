import 'dart:convert';

import 'package:frontend/models/login_model.dart';
import 'package:frontend/screens/seeker%20screen/home_screen.dart';
import 'package:frontend/utils/constants/api_constants.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  final String apiUrl = ApiConstants.baseUrl + ApiConstants.loginUrl;

  userLogin(String username, String password) async {
    Uri apiUri = Uri.parse(apiUrl);
    var response = await http
        .post(apiUri, body: {"username": username, "password": password});
    var result = json.decode(response.body);
    if (result['result'] == 'success') {
      Get.to(() => HomeScreen(username: username, imageUrl: result['datas']['profile']['imageUrl'], id: result['datas']['user']['id'],));
    } else {
      return false;
    }
  }

  Future<void> saveUser(Login login) async {
    Hive.box('login').add(login);
    print(login);
  }
}
