import 'package:estate_listings/data/network/network_api_services.dart';
import 'package:estate_listings/models/home/home_estate_api_model.dart';
import 'package:estate_listings/models/home/home_list_filter_model/home_list_filter_model.dart';

import 'package:estate_listings/res/app_url/app_url.dart';
import 'package:estate_listings/view_models/controller/user_preference/user_preference.dart';
import 'package:flutter/foundation.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();
  final _userPreference = UserPreferences();

  Future<dynamic> homeEstateApi() async {

    try {
      final sharedInfo = await _userPreference.getUser();
      if (sharedInfo.accessToken != null) {
        final headers = {
          'Authorization': '${sharedInfo.tokenType} ${sharedInfo.accessToken}'
        };
        dynamic response = await _apiService.getApi(AppUrl.homeEstateApi,headers: headers);
        return HomeEstateApiModel.fromJson(response);
      }
      else {
        throw Exception('Access token is null');
      }

      
    } catch (e) {
      if (kDebugMode) {
        print('Error in homeEstateApi: $e');
      }
      return null;
      
    }

  }

  Future<dynamic> homeListingFilterApi({Map<String, dynamic>? filters}) async {
    try {
      final sharedInfo = await _userPreference.getUser();

      final queryParameters = filters?.map((key, value) => MapEntry(key, value?.toString() ?? ''));

      if (sharedInfo.accessToken != null) {
        final headers = {
          'Authorization': '${sharedInfo.tokenType} ${sharedInfo.accessToken}'
        };

        final uri = Uri.parse(AppUrl.homeListingFilterApi).replace(queryParameters: queryParameters);

        dynamic response = await _apiService.getApi(uri.toString(), headers: headers);

        return HomeListFilterModel.fromJson(response);
      } else {
        throw Exception('Access token is null');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error in homeListingFilterApi: $e');
      }
      return null;
    }
  }
}


