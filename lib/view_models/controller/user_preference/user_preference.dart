import 'package:estate_listings/models/login/user_api_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{
  Future<bool> saveUser(UserApiModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("accessToken", responseModel.accessToken.toString());
    sp.setString("tokenType", responseModel.tokenType.toString());
    sp.setBool("isLogin", responseModel.isLogin!);
    return true;
  }

  Future<UserApiModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? accessToken = sp.getString("accessToken");
    String? tokenType = sp.getString("tokenType");
    bool? isLogin = sp.getBool("isLogin");

    return UserApiModel(
      accessToken: accessToken,
      tokenType: tokenType,
      isLogin: isLogin,
    );
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.clear();
    return true;
  }
}
