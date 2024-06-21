import 'package:estate_listings/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../res/routes/routes_name.dart';
import '../../view_models/controller/user_preference/user_preference.dart';
import '../home/home_view.dart';
import '../user_profile/user_profile_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final UserPreferences userPreference = UserPreferences();

  final RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.transparentColor,
        elevation: 0,
        title: const Text(
          'EXE ESTATES',
          style: TextStyle(
              color: AppColor.blackColor, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,

        ),
        actions: [
          IconButton(
            onPressed: () {
              userPreference.removeUser().then((value) {

                Get.offAllNamed(RouteName.loginView);
              });
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Obx(() {
        switch (selectedIndex.value) {
          case 0:
            return HomeView();
          case 1:
            return UserProfileView();
          default:
            return Container();
        }
      }),
      bottomNavigationBar: Container(
        // color: Colors.deepPurple[100],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
          child: GNav(
            selectedIndex: selectedIndex.value,
            tabs: [
              GButton(
                  onPressed: () {
                    selectedIndex.value = 0;
                  },
                  icon: Icons.home,
                  text: 'Home',
                  iconColor: Colors.black,
                  textColor: Colors.black,
                  backgroundColor: AppColor.primaryColor),

              GButton(
                onPressed: () {
                  selectedIndex.value = 1;
                },
                icon: Icons.face,
                text: 'Profile',
                iconColor: Colors.black,
                textColor: Colors.black,
                backgroundColor: AppColor.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
