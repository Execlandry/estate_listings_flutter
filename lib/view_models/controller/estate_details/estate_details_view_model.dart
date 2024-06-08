import 'dart:async';

import 'package:estate_listings/data/response/status.dart';
import 'package:estate_listings/models/estate_details/estate_details_api_model.dart';
import 'package:estate_listings/models/home/home_estate_api_model.dart';
import 'package:estate_listings/models/home/home_list_filter_model/home_list_filter_model.dart';
import 'package:estate_listings/repository/estate_details_repository/estate_details_repository.dart';
import 'package:estate_listings/repository/home_repository/home_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class EstateDetailsViewModel extends GetxController {
  final _api = EstateDetailsRepository();

  final rxRequestStatus = Status.LOADING.obs;

  final estateDetailsList = EstateDetailsApiModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  void setEstateDetailsList(EstateDetailsApiModel _value) =>
      estateDetailsList.value = _value;

  void setError(String _value) => error.value = _value;

  void estateDetailsApi(String id) {
    setRxRequestStatus(Status.LOADING);
    _api.estateDetailsApi(id).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setEstateDetailsList(value);
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi(String id) {
    setRxRequestStatus(Status.LOADING);

    _api.estateDetailsApi(id).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setEstateDetailsList(value);
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
