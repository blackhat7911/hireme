class ApiConstants {
  static const String baseUrl = "http://192.168.1.65:8000";
  // "https://hiremebackend.herokuapp.com";
  static const String loginUrl = "/user/login/";
  static const String registerUrl = "/user/register/";
  static const String workUrl = "/work/";
  static const String profile = '/user/profile/';
  static const String workerList = "/user/profile/?accountType=WORKER";
  static const String searchWorker = "/user/profile/?accountType=WORKER&work=";
  static const String workerWorkList = "/worker/?worker_id=3";
  static const String seekerWorkList = "/seeker/?seeker_id=3";
}
