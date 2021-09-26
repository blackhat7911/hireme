import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:frontend/utils/constants/api_constants.dart';

class HomeRepository {
  final String workerListApi = ApiConstants.baseUrl + ApiConstants.workerList;

  Future getWorkerList() async {
    try {
      var uri = Uri.parse(workerListApi);
      var response = await http.get(uri);
      var result = json.decode(response.body);
      print(result);
      return result;
    } catch (e) {
      return Future.error(e);
    }
  }
}
