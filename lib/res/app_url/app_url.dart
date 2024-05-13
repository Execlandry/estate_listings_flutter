import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUrl {
  static String baseUrl = dotenv.get("BASE_URL", fallback: "");
  static String loginApi = '$baseUrl/login';
  static String userApi = "$baseUrl/user-api";

  static String userListingsApi = "$baseUrl/user-listings";
  static String userOffersApi = "$baseUrl/user-listings/";
}