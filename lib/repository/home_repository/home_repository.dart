import 'package:estate_listings/data/network/network_api_services.dart';

import 'package:estate_listings/res/app_url/app_url.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();
  Future<dynamic> homeEstateApi() async {
    dynamic response = await _apiService.getApi(AppUrl.homeEstateApi);

    // return UserListModel.fromJson(response);
  }
}
