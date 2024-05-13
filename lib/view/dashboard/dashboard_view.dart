import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../res/routes/routes_name.dart';
import '../../view_models/controller/user_preference/user_preference.dart';
import '../home/home_view.dart';
import '../user_profile/user_profile_view.dart';

class DashboardView extends StatelessWidget {
  final UserPreferences userPreference = UserPreferences();
  final RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple[200],
        title: const Text(
          'Estate Listings',
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            onPressed: () {
              userPreference.removeUser().then((value) {
                Get.toNamed(RouteName.loginView);
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
        color: Colors.deepPurple[100],
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
                backgroundColor: Colors.deepPurple[200],
              ),
              GButton(
                onPressed: () {
                  selectedIndex.value = 1;
                },
                icon: Icons.face,
                text: 'Profile',
                iconColor: Colors.black,
                textColor: Colors.black,
                backgroundColor: Colors.deepPurple[200],
              ),
              // GButton(
              //   onPressed: () {
              //     selectedIndex.value = 1;
              //     // Navigate to the search view
              //   },
              //   icon: Icons.search,
              //   text: 'Search',
              //   iconColor: Colors.black,
              //   textColor: Colors.black,
              //   backgroundColor: Colors.deepPurple[200],
              // ),
              // GButton(
              //   onPressed: () {
              //     selectedIndex.value = 2;
              //     // Navigate to the cart view
              //   },
              //   icon: Icons.shopping_cart,
              //   text: 'Cart',
              //   iconColor: Colors.black,
              //   textColor: Colors.black,
              //   backgroundColor: Colors.deepPurple[200],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
