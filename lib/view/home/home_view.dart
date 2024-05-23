import 'package:estate_listings/models/home/home_estate_api_model.dart';
import 'package:estate_listings/res/assets/image_assets.dart';
import 'package:estate_listings/res/colors/app_color.dart';
import 'package:estate_listings/res/fonts/app_fonts.dart';
import 'package:estate_listings/view/home/widget/home_estate_tile.dart';
import 'package:estate_listings/view_models/controller/user_preference/user_preference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<HomeEstateApiModel> estateMenu = [
    HomeEstateApiModel(
      name: "Crestwood Estates",
      price: "350.000",
      imagePath: [ImageAssets.house1, ImageAssets.splashView], // List of images
      rating: "3.4",
    ),
    HomeEstateApiModel(
      name: "Bluebell Grove",
      price: "450.000",
      imagePath: [ImageAssets.house1, ImageAssets.splashView], // List of images
      rating: "4.5",
    ),
  ];

  UserPreferences userPreference = UserPreferences();
  final dropdownValue = 'Option 1'.obs;

  @override
  void initState() {
    super.initState();
    // homeController.userList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.transparentColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Get 40% Off",
                      style: TextStyle(
                        fontFamily: AppFonts.balettaFont,
                        fontSize: 20,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    SizedBox(height: 20),
                    //button
                  ],
                ),
                Image.asset(
                  ImageAssets.house1,
                  width: 100,
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.whiteColor,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.whiteColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Search",
              ),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "All listings ->",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: estateMenu.length,
              itemBuilder: (context, index) => HomeEstateTile(
                homeEstateApiModel: estateMenu[index],
              ),
            ),
          ),
          SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              color: AppColor.greyColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      ImageAssets.house1,
                      height: 60,
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Villa Estella",
                          style: TextStyle(fontFamily: AppFonts.tomatoesFont),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "6.6",
                          style: TextStyle(color: AppColor.blackColor),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.favorite,
                  color: AppColor.redColor,
                  size: 28,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
