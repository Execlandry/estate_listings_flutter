import 'package:carousel_slider/carousel_slider.dart';
import 'package:estate_listings/data/response/status.dart';
import 'package:estate_listings/res/assets/image_assets.dart';
import 'package:estate_listings/res/colors/app_color.dart';
import 'package:estate_listings/res/components/internet_exceptions_widget.dart';
import 'package:estate_listings/res/routes/routes_name.dart';
import 'package:estate_listings/view/estate_details/estate_details_view.dart';

import 'package:estate_listings/view/home/widget/home_estate_tile_widget.dart';
import 'package:estate_listings/view/home/widget/home_filter_view_widget.dart';
import 'package:estate_listings/view_models/controller/home/home_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class HomeView extends StatefulWidget {

  const HomeView({Key? key}) : super(key: key);


  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeVM = Get.put(HomeViewModel());

  @override
  void initState() {
    super.initState();

    homeVM.homeEstateList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.transparentColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              decoration: BoxDecoration(
                color: AppColor.bannerColor,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: 25),
              padding: EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Get 20% promo on your first Deal",
                        style: TextStyle(
                            // fontSize: 25,
                            color: AppColor.whiteColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Buy Now ->",
                        style: TextStyle(
                            // fontSize: 25,
                            color: AppColor.whiteColor),
                      ),
                    ],
                  ),
                  Image.asset(
                    ImageAssets.house1,
                    height: 80,
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

                      child: HomeFilterViewWidget(
                        onClearFilters: () {
                          homeVM.isFilterApplied.value = false; // Clear filters
                        },
                        onApplyFilters: (filters) {
                          homeVM.isFilterApplied.value = true; // Apply filters
                          homeVM.homeListingFilterApi(filters: filters);
                          homeVM.toggleFilterMenu();
                        },
                      ),
                    )
                  : SizedBox.shrink(),
            ),
            SizedBox(height: 10),
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
              height: 10,
            ),
            Obx(() {
              if (homeVM.rxRequestStatus.value == Status.LOADING) {
                return Center(child: CircularProgressIndicator());
              } else if (homeVM.rxRequestStatus.value == Status.ERROR) {
                return InternetExceptionsWidget(
                  onPress: () {
                    homeVM.refreshApi();
                  },
                );
              } else if (homeVM.rxRequestStatus.value == Status.COMPLETED) {
                return homeVM.isFilterApplied.value
                    ? SizedBox(
                        height: 350,
                        child: Center(
                          child: CarouselSlider.builder(
                            itemCount: homeVM
                                .homeListFilterList.value.listings!.length,
                            itemBuilder: (context, index, realIndex) {
                              List<String> imagePaths = homeVM
                                  .homeListFilterList
                                  .value
                                  .listings![index]
                                  .images!
                                  .map((image) => image.src!)
                                  .toList();
                              return GestureDetector(
                                onTap: () {
                                  var listingId = homeVM.homeListFilterList
                                      .value.listings![index].id
                                      .toString();

                                  Get.toNamed(RouteName.estateDetailsView,
                                      arguments: {'id': listingId});
                                },
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: HomeEstateTileWidget(
                                        imagePaths: imagePaths,
                                        city: homeVM.homeListFilterList.value.listings![index].city
                                            .toString(),
                                        street: homeVM.homeListFilterList.value
                                            .listings![index].street
                                            .toString(),
                                        beds: homeVM.homeListFilterList.value
                                            .listings![index].beds
                                            .toString(),
                                        baths: homeVM.homeListFilterList.value
                                            .listings![index].baths
                                            .toString(),
                                        area: homeVM.homeListFilterList.value
                                            .listings![index].area
                                            .toString(),
                                        price: homeVM.homeListFilterList.value.listings![index].price.toString())),
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
                      )
                    : SizedBox(
                        height: 350,
                        child: Center(
                          child: CarouselSlider.builder(
                            itemCount:
                                homeVM.homeEstateList.value.listings!.length,
                            itemBuilder: (context, index, realIndex) {
                              List<String> imagePaths = homeVM
                                  .homeEstateList.value.listings![index].images!
                                  .map((image) => image.src!)
                                  .toList();
                              return GestureDetector(
                                onTap: () {
                                  String listingId = homeVM
                                      .homeEstateList.value.listings![index].id
                                      .toString();
                                  Get.toNamed(RouteName.estateDetailsView,
                                      arguments: {'id': listingId});

                                  // Get.toNamed(RouteName.estateDetailsView,
                                  //     arguments: {'id': listingId});
                                },
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: HomeEstateTileWidget(
                                        imagePaths: imagePaths,
                                        city: homeVM.homeEstateList.value
                                            .listings![index].city
                                            .toString(),
                                        street: homeVM.homeEstateList.value
                                            .listings![index].street
                                            .toString(),
                                        beds: homeVM.homeEstateList.value
                                            .listings![index].beds
                                            .toString(),
                                        baths: homeVM.homeEstateList.value
                                            .listings![index].baths
                                            .toString(),
                                        area: homeVM.homeEstateList.value
                                            .listings![index].area
                                            .toString(),
                                        price: homeVM.homeEstateList.value.listings![index].price.toString())),
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
                      );
              }
              return SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}
