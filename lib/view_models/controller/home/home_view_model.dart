
import 'dart:async';

import 'package:estate_listings/data/response/status.dart';
import 'package:estate_listings/models/home/home_estate_api_model.dart';
import 'package:estate_listings/models/home/home_list_filter_model/home_list_filter_model.dart';
import 'package:estate_listings/repository/home_repository/home_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

// import '../../../data/response/status.dart';

class HomeViewModel extends GetxController {
  var isFilterMenuVisible = false.obs;
  var blink = true.obs;
  RxBool isFilterApplied = false.obs;


  HomeViewModel() {
    Timer.periodic(Duration(milliseconds: 1500), (timer) {
      blink.value = !blink.value;
    });
    homeEstateApi();
  }

  void toggleFilterMenu() {
    isFilterMenuVisible.value = !isFilterMenuVisible.value;
  }

  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;

  final homeEstateList = HomeEstateApiModel().obs;

  final homeListFilterList = HomeListFilterModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  void setHomeEstateList(HomeEstateApiModel _value) =>
      homeEstateList.value = _value;

  void setHomeListingFilterList(HomeListFilterModel _value) =>
      homeListFilterList.value = _value;
      
  void setError(String _value) => error.value = _value;

  void homeEstateApi() {
    setRxRequestStatus(Status.LOADING);
    _api.homeEstateApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setHomeEstateList(value);
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

//filtering list
  void homeListingFilterApi({Map<String, dynamic>? filters}) {
    setRxRequestStatus(Status.LOADING);
    _api.homeListingFilterApi(filters: filters).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setHomeListingFilterList(value);
      }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);

    _api.homeEstateApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setHomeEstateList(value);
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });

    _api.homeListingFilterApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setHomeListingFilterList(value);
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
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

// void clearFilters() {
//   fetchHomeListings();
// }
