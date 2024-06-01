import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUrl {
  static String baseUrl = dotenv.get("BASE_URL", fallback: "");

  //Auth related
  static String userLoginApi = '$baseUrl/login';

  //Home Screen related api
  static String homeEstateApi = "$baseUrl/listing";
  static String homeListingFilterApi = "$baseUrl/listing/";

  // static String homeEstateApi = "$baseUrl/user-api";//to fetch users on homepage

  //currently logged in user data
  static String userEstatesApi = "$baseUrl/user-listings";
  static String userOffersApi = "$baseUrl/user-listings/"; //yet to implement
}
