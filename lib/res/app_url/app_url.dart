

import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUrl{

  static String baseUrl = dotenv.get("BASE_URL",fallback: "");
  static String loginApi = '$baseUrl/api/login';
  // static String userListApi = '$baseUrl/api/users?page';
  static String userListApi = baseUrl;



}