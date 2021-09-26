import 'dart:convert';

import 'package:frontend/data/repo/login_repo.dart';
import 'package:frontend/screens/profile_screen.dart';
import 'package:frontend/utils/constants/api_constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterRepository {
  final String apiUrl = ApiConstants.baseUrl + ApiConstants.registerUrl;
LoginRepository _loginRepo = LoginRepository();
  Future userRegister(String username, String email, String password) async {
    try {
      Uri apiUri = Uri.parse(apiUrl);
      var response = await http.post(apiUri,
          body: {"username": username, "email": email, "password": password});
      print(response.body);
      var result = json.decode(response.body);
      print(result);
      if (response.statusCode == 200) {
        // _loginRepo.saveUser(result);
        Get.to(() => ProfileSetUpScreen());
      } else {
        return false;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
