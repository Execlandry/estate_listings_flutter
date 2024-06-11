// import 'package:estate_listings/models/home/HomeEstateApiModel.dart';
// import 'package:estate_listings/repository/home_repository/home_repository.dart';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

// import '../../../data/response/status.dart';

class HomeViewModel extends GetxController {
  var isFilterMenuVisible = false.obs;
  var blink = true.obs;

  HomeViewModel() {
    Timer.periodic(Duration(milliseconds: 1500), (timer) {
      blink.value = !blink.value;
    });
  }

  void toggleFilterMenu() {
    isFilterMenuVisible.value = !isFilterMenuVisible.value;
  }
//   final _api = HomeRepository();

//   final rxRequestStatus = Status.LOADING.obs;
//   final userList = UserListModel().obs;
//   RxString error = ''.obs;

//   void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
//   void setUserList(UserListModel _value) => userList.value = _value;
//   void setError(String _value) => error.value = _value;

//   void homeEstateApi() {
//     _api.homeEstateApi().then((value) {
//       setRxRequestStatus(Status.COMPLETED);
//       setUserList(value);
//     }).onError((error, stackTrace) {
//       print(error);
//       print(stackTrace);
//       setError(error.toString());
//       setRxRequestStatus(Status.ERROR);
//     });
//   }

//   void refreshApi() {
//     setRxRequestStatus(Status.LOADING);
//     _api.homeEstateApi().then((value) {
//       setRxRequestStatus(Status.COMPLETED);
//       setUserList(value);
//     }).onError((error, stackTrace) {
//       if (kDebugMode) {
//         print(error);
//         print(stackTrace);
//       }
//       setError(error.toString());
//       setRxRequestStatus(Status.ERROR);
//     });
//   }
}
