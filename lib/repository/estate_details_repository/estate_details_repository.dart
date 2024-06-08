import 'package:estate_listings/data/network/network_api_services.dart';
import 'package:estate_listings/models/estate_details/estate_details_api_model.dart';
import 'package:estate_listings/models/home/home_estate_api_model.dart';
import 'package:estate_listings/models/home/home_list_filter_model/home_list_filter_model.dart';

import 'package:estate_listings/res/app_url/app_url.dart';
import 'package:estate_listings/view_models/controller/user_preference/user_preference.dart';
import 'package:flutter/foundation.dart';

class EstateDetailsRepository {
  final _apiService = NetworkApiServices();
  final _userPreference = UserPreferences();

  Future<dynamic> estateDetailsApi(String id) async {

    try {
      final sharedInfo = await _userPreference.getUser();
      if (sharedInfo.accessToken != null) {
        final headers = {
          'Authorization': '${sharedInfo.tokenType} ${sharedInfo.accessToken}'
        };
        dynamic response = await _apiService.getApi('${AppUrl.estateDetailsApi}$id',headers: headers);
        // if (kDebugMode) {
        //   print('API Response: $response');
        // }
        return EstateDetailsApiModel.fromJson(response[0]);
      }
      else {
        throw Exception('Access token is null');
      }

      
    } catch (e) {
      if (kDebugMode) {
        print('Error in estateDetailsApi: $e');
      }
      return null;
      
    }

  }
}


