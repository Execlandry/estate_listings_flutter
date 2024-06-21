import 'dart:async';

import 'package:estate_listings/res/routes/routes_name.dart';
import 'package:estate_listings/view_models/controller/user_preference/user_preference.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SplashViewServices {
  UserPreferences userPreference = UserPreferences();
  void isLogin() {
    userPreference.getUser().then((value) {
      if (kDebugMode) {
        print(value.tokenType);
        print(value.accessToken);
        print(value.isLogin);
      }
      if (value.isLogin == false || value.isLogin.toString() == 'null') {
        Timer(Duration(seconds: 3), () => Get.offAllNamed(RouteName.loginView));
      } else {
        //change this path to make redirect after splash screen
        Timer(Duration(seconds: 3),
            () => Get.offAllNamed(RouteName.dashboardView));
      }
    });
  }
}
