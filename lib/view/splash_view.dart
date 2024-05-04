import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  // SplashViewServices splashView = SplashViewServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // splashView.isLogin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Image(image: AssetImage(ImageAssets.SplashView)),
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

      backgroundColor: Colors.teal,
      body: Center(
        child: Text(
          "Welcome_back".tr,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
