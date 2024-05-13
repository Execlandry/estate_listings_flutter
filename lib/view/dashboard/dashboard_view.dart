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
    );
  }
}
