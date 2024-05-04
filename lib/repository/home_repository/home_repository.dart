import 'package:estate_listings/data/network/network_api_services.dart';
import 'package:estate_listings/models/home/user_list_model.dart';
import 'package:estate_listings/res/app_url/app_url.dart';


class HomeRepository{
  final _apiService =NetworkApiServices();
  Future<dynamic> userListApi() async{
    dynamic response = await _apiService.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response);
  }
}