import 'package:carousel_slider/carousel_slider.dart';
import 'package:estate_listings/data/response/status.dart';
import 'package:estate_listings/res/colors/app_color.dart';
import 'package:estate_listings/view/home/widget/home_estate_tile_widget.dart';
import 'package:estate_listings/view/home/widget/home_filter_view_widget.dart';
import 'package:estate_listings/view_models/controller/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
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
              height: 20,
            ),
            Obx(() {
              if (homeVM.rxRequestStatus.value == Status.LOADING) {
                return Center(child: CircularProgressIndicator());
              } else if (homeVM.rxRequestStatus.value == Status.ERROR) {
                return Center(child: Text("Error Occurred"));
              } else if (homeVM.rxRequestStatus.value == Status.COMPLETED) {
                return homeVM.isFilterApplied.value
                    ? SizedBox(
                        height: 350,
                        child: Center(
                          child: CarouselSlider.builder(
                            itemCount: homeVM
                                .homeListFilterList.value.listings!.length,
                            itemBuilder: (context, index, realIndex) {
                              return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: HomeEstateTileWidget(
                                      city: homeVM.homeListFilterList.value
                                          .listings![index].city
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
                                      price:
                                          homeVM.homeListFilterList.value.listings![index].price.toString()));
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
                              return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: HomeEstateTileWidget(
                                      imagePaths: imagePaths,
                                      city: homeVM.homeEstateList.value.listings![index].city
                                          .toString(),
                                      street: homeVM.homeEstateList.value
                                          .listings![index].street
                                          .toString(),
                                      beds: homeVM.homeEstateList.value.listings![index].beds
                                          .toString(),
                                      baths: homeVM.homeEstateList.value
                                          .listings![index].baths
                                          .toString(),
                                      area: homeVM.homeEstateList.value
                                          .listings![index].area
                                          .toString(),
                                      price: homeVM.homeEstateList.value
                                          .listings![index].price
                                          .toString()));
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
