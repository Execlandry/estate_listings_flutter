import 'dart:async';

import 'package:estate_listings/data/response/status.dart';
import 'package:estate_listings/models/home/home_list_filter_model/home_list_filter_model.dart';
import 'package:estate_listings/repository/home_repository/home_repository.dart';
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

  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final homeListFilterList = HomeListFilterModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setHomeListingFilterlist(HomeListFilterModel _value) =>
      homeListFilterList.value = _value;
  void setError(String _value) => error.value = _value;

//filtering list
  void homeListingFilterApi({Map<String, dynamic>? filters}) {
    setRxRequestStatus(Status.LOADING);
    _api.homeListingFilterApi(filters: filters).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setHomeListingFilterlist(value);
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);
    _api.homeListingFilterApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setHomeListingFilterlist(value);
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}

// void clearFilters() {
//   fetchHomeListings();
// }
