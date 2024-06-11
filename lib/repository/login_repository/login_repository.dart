import 'package:estate_listings/data/network/network_api_services.dart';
import 'package:estate_listings/res/app_url/app_url.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();
  Future<dynamic> userLoginApi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.userLoginApi);
    return response;
  }
}
