// ignore_for_file: constant_identifier_names
// import 'package:socket_io_client/socket_io_client.dart' as IO;

class Constants {
  // Time Format .....
  static const String YYYY_MM_DD_HH_MM_SS = 'yyyy-MM-dd hh:mm:ss';
  static const String YYYY_MM_DD_HH_MM_SS_24 = 'yyyy-MM-dd HH:mm:ss';
  static const String HH_MM_A = 'hh:mm a';
  static const String YYYY_MM_DD = 'yyyy-MM-dd';
  static const String DD_MM_YYYY = 'dd-MM-yyyy';

  static const String appName = 'UPWATCH';

  // Api credential .....
  // static const String baseUrl = 'https://kmphitech.com/credisliceApi/api/app/';
  // static const String baseUrl = 'http://192.168.29.36/credislice_backend/api/app/';
  static const String baseUrl = 'http://52.203.103.74/CredisliceApi/public/index.php/api/app/';
  static const String apiKey = '69d5eb2052ac7712cf5e4b40famz3152';

  static const String login = 'login';
  static const String sendSignupOTP = 'sendSignupOTP';
  static const String signUp = 'signUp';
  static const String forgotPassword = 'forgotPwd';
  static const String updateProfile = 'updateProfile';
  static const String changePassword = 'changePassword';
  static const String logOut = 'logout';
  static const String deleteAccount = 'deleteAccount';
  static const String getHome = 'getHome';
}

class ResponseStatus {
  static const int fail = 0;
  static const int success = 1;
  static const int NotConfirmAccount = 2;
}

bool isDevelopmentMode = false;

class AppFontFamily {
  static const String GothamRounded = 'GothamRounded';
  static const String GothamRoundedMedium = 'GothamRoundedMedium';
}
