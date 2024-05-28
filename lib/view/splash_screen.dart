import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:google_nav_bar/google_nav_bar.dart";
import "package:project_1/data/app_exceptions.dart";
import "package:project_1/res/colors/app_color.dart";

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
          backgroundColor: AppColor.whiteColor,
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)
          ),
          title:
          Center(child: Text('Estate Listings', textAlign: TextAlign.center, style: GoogleFonts.dmSerifDisplay(fontSize: 25),)),
          actions: [IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))],
        ),

        SliverToBoxAdapter(
          child: Container(
            color: AppColor.whiteColor,
          ),
        )],
      ),
    bottomNavigationBar:
    Container(
      color: AppColor.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GNav(
          color: AppColor.blackColor,
          activeColor: AppColor.whiteColor  ,
          tabBackgroundColor: AppColor.redColor,
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
    );
  }
}
