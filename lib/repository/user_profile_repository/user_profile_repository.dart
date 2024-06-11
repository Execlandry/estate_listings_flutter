import 'package:estate_listings/data/network/network_api_services.dart';
import 'package:estate_listings/models/user_profile/user_estates_model.dart';
import 'package:estate_listings/res/app_url/app_url.dart';
import 'package:estate_listings/view_models/controller/user_preference/user_preference.dart';
import 'package:flutter/foundation.dart';

class UserProfileRepository {
  final _apiService = NetworkApiServices();
  final _userPreference = UserPreferences();

  Future<dynamic> userEstatesApi() async {
    try {
      final sharedInfo = await _userPreference.getUser();

      if (sharedInfo.accessToken != null) {
        final headers = {
          // 'Accept' : 'Application/Json',
          'Authorization': '${sharedInfo.tokenType} ${sharedInfo.accessToken}'
        };

        dynamic response = await _apiService.getApi(AppUrl.userEstatesApi, headers: headers);

        return UserEstatesModel.fromJson(response);
      } else {}
    } catch (e) {
      if (kDebugMode) {
        print('Error in userEstatesApi: $e');
      }
    }
  }
}
