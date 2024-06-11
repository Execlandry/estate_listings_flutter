
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:google_nav_bar/google_nav_bar.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [SliverAppBar.large(
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)
          ),
          title:
          Center(child: Text('Estate Listings', textAlign: TextAlign.center, style: GoogleFonts.dmSerifDisplay(fontSize: 25),)),
          actions: [IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))],
        ),

        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
          ),
        )],
      ),
    bottomNavigationBar:
    Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GNav(
          color: Colors.black,
          activeColor: Colors.white  ,
          tabBackgroundColor: Colors.red,
          gap: 8,
          padding: EdgeInsets.all(20),

          tabs: const [
            GButton(icon: Icons.home, text: "Home",),
            GButton(icon: Icons.search, text: "Search"),
            GButton(icon: Icons.shopping_cart, text: "Cart"),
            GButton(icon: Icons.face, text: "Profile")
          ],
        ),
      ),
    ),
=======
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
        title: Center(
          child: const Text(
            'Estates',
            style: TextStyle(color: AppColor.blackColor),
            textAlign: TextAlign.center,
          ),
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
                backgroundColor: AppColor.primaryColor
              ),
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
    );
  }
}
