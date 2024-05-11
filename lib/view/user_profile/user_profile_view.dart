import 'package:estate_listings/data/response/status.dart';
import 'package:estate_listings/res/components/general_exceptions_widget.dart';
import 'package:estate_listings/res/components/internet_exceptions_widget.dart';
import 'package:estate_listings/res/routes/routes_name.dart';
import 'package:estate_listings/view_models/controller/user_preference/user_preference.dart';
import 'package:estate_listings/view_models/controller/user_profile/user_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  final userProfileController = Get.put(UserProfileViewModel());
  UserPreferences userPreference = UserPreferences();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userProfileController.userListingsApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (userProfileController.rxRequestStatus.value) {
          case Status.LOADING:
            return Center(
              child: CircularProgressIndicator(),
            );

          case Status.ERROR:
            if (userProfileController.error.value == 'No Internet:') {
              return InternetExceptionsWidget(onPress: () {
                userProfileController.refreshApi();
              });
            } else {
              return GeneralExceptionsWidget(onPress: () {
                userProfileController.refreshApi();
              });
            }

          case Status.COMPLETED:
            return Center(
              child: ListView.builder(
                  itemCount: userProfileController.userListingsList.value.listings!.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        // leading: CircleAvatar(
                        //   backgroundImage: NetworkImage(userProfileController
                        //       .userList.value.data![index].avatar
                        //       .toString()),
                        // ),
                        title: Text(userProfileController
                            .userListingsList.value.listings!.data![index].city
                            .toString()),
                        subtitle: Text(userProfileController
                            .userListingsList.value.listings!.data![index].imagesCount
                            .toString()),
                      ),
                    );
                  }),
            );
        }
      }),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                userPreference.removeUser().then((value) {
                  Get.toNamed(RouteName.loginView);
                });
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
