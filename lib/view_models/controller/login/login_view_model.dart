import 'package:estate_listings/models/login/user_login_api_model.dart';
import 'package:estate_listings/repository/login_repository/login_repository.dart';
import 'package:estate_listings/res/routes/routes_name.dart';
import 'package:estate_listings/utils/utils.dart';
import 'package:estate_listings/view_models/controller/user_preference/user_preference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();
  UserPreferences userPreference = UserPreferences();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  void userLoginApi() {
    loading.value = true;

    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };

    _api.userLoginApi(data).then((value) {
      loading.value = false;

      if (value['error'] == 'user not found') {
        Utils.snackBar("Login", value['error']);
      } else {
        UserLoginApiModel userLoginApiModel = UserLoginApiModel(
            accessToken: value['access_token'],
            tokenType: value['token_type'],
            isLogin: true);

        userPreference.saveUser(userLoginApiModel).then((value) {
          Get.delete<LoginViewModel>();
          Get.toNamed(RouteName.dashboardView)!.then((value) {});
        }).onError((error, stackTrace) {});
        Utils.snackBar("Login", "Login successful");
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      loading.value = false;
      Utils.snackBar("Error", error.toString());
    });
  }
}
