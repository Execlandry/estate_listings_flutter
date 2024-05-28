import 'package:estate_listings/data/response/status.dart';
import 'package:estate_listings/models/user_profile/user_estates_model.dart';
import 'package:estate_listings/repository/user_profile_repository/user_profile_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class UserProfileViewModel extends GetxController {
  final _api = UserProfileRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userListingsList = UserEstatesModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  void setUserListingList(UserEstatesModel _value) =>
      userListingsList.value = _value;

  void setError(String _value) => error.value = _value;

  void userEstatesApi() {
    _api.userEstatesApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserListingList(value);
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);
    _api.userEstatesApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserListingList(value);
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
