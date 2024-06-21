import 'package:estate_listings/res/assets/image_assets.dart';
import 'package:estate_listings/res/colors/app_color.dart';
import 'package:estate_listings/res/fonts/app_fonts.dart';
import 'package:estate_listings/view_models/services/splash_services.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashViewServices splashView = SplashViewServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashView.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                "EXE ESTATES",
                style: TextStyle(
                    // fontFamily: AppFonts.tomatoesFont,
                    fontWeight: FontWeight.bold,
                    color: AppColor.whiteColor),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.all(50.0),
              child: Image(
                image: AssetImage(ImageAssets.splashView),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "The estates you have always dreamed of",
              style: TextStyle(
                  fontFamily: AppFonts.tomatoesFont,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColor.whiteColor),
            ),
            SizedBox(
              height: 10,
            ),

            Center(
              child: Text(
                "it will never be the same again",
                style: TextStyle(
                  color: AppColor.greyColor,
                  height: 2,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),

      // body: InternetExceptionsWidget(onPress: () {  },),
      // body: GeneralExceptionsWidget(onPress: () {  },),
      // body: Column(
      //   children: [RoundButtonWidget(title: "Login ", onPress: () {},width: double.infinity,)],
      // ),

      // appBar: AppBar(
      //     backgroundColor: Colors.blue,
      //     title: Center(
      //         child: Text(
      //       'email_hint'.tr,
      //       style: TextStyle(fontFamily: AppFonts.schylerRegular),
      //     ))),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   // throw InternetException("Check your Wifi");
      //   Utils.toastMessage("Exeboii1");
      //   Utils.toastMessageCenter("Exeboii2");
      // }),

      // backgroundColor: Colors.teal,
      // body: Center(
      //   child: Text(
      //     "Welcome_back".tr,
      //     textAlign: TextAlign.center,
      //   ),
      // ),
    );
  }
}
