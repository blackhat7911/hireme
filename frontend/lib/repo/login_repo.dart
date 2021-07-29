import 'package:frontend/models/login_model.dart';
import 'package:frontend/utils/constants/api_constants.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  final String apiUrl = ApiConstants.baseUrl + ApiConstants.loginUrl;

  Future<bool> userLogin(String username, String password) async {
    try {
      Uri apiUri = Uri.parse(apiUrl);
      var response = await http
          .post(apiUri, body: {"username": username, "password": password});
      if (response.statusCode == 200) {
        print(response.body);
        saveUser(Login(response.body));
        return true;
      } else {
        return Future.error("Invalid Username or password");
      }
    } catch (e) {
      return Future.error("Invalid Username or password");
    }
  }

  Future<void> saveUser(Login login) async {
    Hive.box('login').add(login);
  }
}
