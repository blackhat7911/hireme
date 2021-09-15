import 'package:frontend/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class RegisterRepository {
  final String apiUrl = ApiConstants.baseUrl + ApiConstants.registerUrl;

  Future<bool> userRegister(
      String username, String email, String password) async {
    try {
      Uri apiUri = Uri.parse(apiUrl);
      var response = await http.post(apiUri,
          body: {"username": username, "email": email, "password": password});
      if (response.statusCode == 200) {
        return true;
      } else {
        return Future.error("Couldnot register user");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
