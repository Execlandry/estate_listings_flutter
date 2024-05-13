import 'package:estate_listings/res/components/general_exceptions_widget.dart';
import 'package:estate_listings/res/components/internet_exceptions_widget.dart';
import 'package:estate_listings/view_models/controller/user_preference/user_preference.dart';
import 'package:estate_listings/view_models/controller/user_profile/user_offers/user_offers_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/response/status.dart';

class UserOfferView extends StatefulWidget {
  const UserOfferView({super.key});

  @override
  State<UserOfferView> createState() => _UserOfferViewState();
}

class _UserOfferViewState extends State<UserOfferView> {
  final userOffersController = Get.put(UserOffersViewModel());
  UserPreferences userPreference = UserPreferences();

  @override
  void initState() {
    super.initState();
    userOffersController.userOffersApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      switch (userOffersController.rxRequestStatus.value) {
        case Status.LOADING:
          return Center(
            child: CircularProgressIndicator(),
          );
        case Status.ERROR:
          if (userOffersController.error.value == 'No Internet:') {
            return InternetExceptionsWidget(
              onPress: () {
                userOffersController.refreshApi();
              },
            );
          } else {
            return GeneralExceptionsWidget(
              onPress: () {
                userOffersController.refreshApi();
              },
            );
          }
        case Status.COMPLETED:
          return Obx(() => ListView.builder(
              itemCount: userOffersController
                  .userOffersList.value.listing?.offers!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(userOffersController
                      .userOffersList.value.listing!.offers![index].bidder!.name
                      .toString()),
                );
              }));
      }
    }));
  }
}
