import 'package:dio/dio.dart';
import 'package:frontend/utils/constants/api_constants.dart';

class HomeRepository {
  final String workerListApi = ApiConstants.baseUrl + ApiConstants.workerList;

  Future<void> getWorker() async {
    try {
      final response =
          await Dio().get(ApiConstants.baseUrl + ApiConstants.workerList);
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
