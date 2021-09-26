import 'package:dio/dio.dart';
import 'package:frontend/screens/seeker%20screen/home_screen.dart';
import 'package:frontend/utils/constants/api_constants.dart';
import 'package:get/get.dart';

class ProfileRepo {
  final String apiUrl = ApiConstants.baseUrl + ApiConstants.profile;
  Dio dio = Dio();
  profileSetup(fullname, phone, profile, dob, accType, location) async {
    Map<String, dynamic> dataToUpload = {"fullname": fullname,
      "phone": phone,
      "profile": await MultipartFile.fromFile(profile.path,
          filename: profile.path.split('/').last),
      "date_of_birth": dob,
      "accountType": accType,
      "location": location,};
    var formData = FormData.fromMap(dataToUpload);
    var res = await dio.post(
      apiUrl,
      data: formData,
    );
    if (res.statusCode == 200) {
      Get.to(() => HomeScreen());
    } else {
      Get.snackbar("Error", "Something went wrong");
    }
  }
}
