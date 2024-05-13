

import 'package:estate_listings/data/response/status.dart';
import 'package:estate_listings/models/user_profile/user_offers/user_offers_models.dart';
import 'package:estate_listings/repository/user_profile_repository/user_offers_repository/user_offers_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class UserOffersViewModel extends GetxController{
  final _api = UserOffersRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userOffersList = UserOffersModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) =>
  rxRequestStatus.value = _value;

  void setUserOffersList(UserOffersModel _value)=>
  userOffersList.value = _value;

  void setError(String _value) =>error.value = _value;


  void userOffersApi(){
    _api.userOffersApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserOffersList(value);

    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi(){
    setRxRequestStatus(Status.LOADING);
    _api.userOffersApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserOffersList(value);
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
