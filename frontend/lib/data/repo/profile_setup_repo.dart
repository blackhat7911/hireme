// import 'dart:convert';
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:frontend/utils/constants/api_constants.dart';
// import 'package:get/get.dart';

// class ProfileRepo {
//   final String apiUrl = ApiConstants.baseUrl + ApiConstants.profile;
//   Dio dio = Dio();
//   Future<bool> addPost(
//       {required File image, String? username, String? dob, String? address, String? occupation, String? accType}) async {
//     try {
//       Map<String, dynamic> dataToUpload = {
//         'source': await MultipartFile.fromFile(image.path,
//             filename: image.path.split('/').last),
//         'description': description
//       };
//       if (username != null) {
//         dataToUpload["user"] = username;
//       }
//       var formData = FormData.fromMap(dataToUpload);
//       var response = await dio.post(apiUrl, data: formData);
//       Map decodedResponse = json.decode(response.toString());
//       if (response.statusCode == 200) {
//         Get.to(() => )
//         return true;
//       } else if (response.statusCode == 400) {
//         if (decodedResponse["error"]["message"] != null) {
//           return Future.error(decodedResponse["error"]["message"]);
//         } else {
//           return Future.error("Memes Upload Failed.1");
//         }
//       } else {
//         return Future.error("Memes Upload Failed.2");
//       }
//     } catch (e) {
//       return Future.error("Memes Upload Failed.3");
//     }
//   }
//   }
// }
