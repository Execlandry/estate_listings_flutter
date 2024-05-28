import 'package:carousel_slider/carousel_slider.dart';
import 'package:estate_listings/models/home/home_estate_api_model.dart';
import 'package:estate_listings/res/assets/image_assets.dart';
import 'package:estate_listings/res/colors/app_color.dart';
import 'package:estate_listings/res/fonts/app_fonts.dart';
import 'package:estate_listings/view/home/widget/home_estate_tile_widget.dart';
import 'package:estate_listings/view/home/widget/home_filter_view_widget.dart';
import 'package:estate_listings/view_models/controller/home/home_view_model.dart';
import 'package:estate_listings/view_models/controller/user_preference/user_preference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeVM = Get.put(HomeViewModel());

  List<HomeEstateApiModel> estateMenu = [
    HomeEstateApiModel(
      name: "Crestwood Estates",
      price: "350.000",
      imagePath: [ImageAssets.house1, ImageAssets.splashView],
      rating: "3.4",
    ),
    HomeEstateApiModel(
      name: "Bluebell Grove",
      price: "450.000",
      imagePath: [ImageAssets.house1, ImageAssets.splashView],
      rating: "4.5",
    ),
  ];

  UserPreferences userPreference = UserPreferences();
  final dropdownValue = 'Option 1'.obs;

  @override
  void initState() {
    super.initState();
    // homeVM.userList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.transparentColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            SizedBox(height: 15),
            Center(
              child: GestureDetector(
                onTap: homeVM.toggleFilterMenu,
                child: Obx(
                  () => Opacity(
                    opacity: homeVM.blink.value ? 1 : 0.5,
                    child: Text(
                      "Filter Listings",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => homeVM.isFilterMenuVisible.value
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: HomeFilterViewWidget(),
                    )
                  : SizedBox.shrink(),
            ),
            SizedBox(height: 20),
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
            SizedBox(
              height: 350,
              child: Center(
                child: CarouselSlider.builder(
                  itemCount: estateMenu.length,
                  itemBuilder: (context, index, realIndex) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: HomeEstateTileWidget(
                        homeEstateApiModel: estateMenu[index],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 700,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlay: true,
                    viewportFraction: 0.6,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
