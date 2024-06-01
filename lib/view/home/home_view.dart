import 'package:estate_listings/data/response/status.dart';
import 'package:estate_listings/res/colors/app_color.dart';
import 'package:estate_listings/view/home/widget/home_estate_tile_widget.dart';
import 'package:estate_listings/view/home/widget/home_filter_view_widget.dart';
import 'package:estate_listings/view_models/controller/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final HomeViewModel homeVM = Get.put(HomeViewModel());

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
                          // homeVM.clearFilters();
                        },
                        onApplyFilters: (filters) {
                          homeVM.homeListingFilterApi(filters: filters);
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
            Obx(() {
              if (homeVM.rxRequestStatus.value == Status.LOADING) {
                return Center(child: CircularProgressIndicator());
              } else if (homeVM.rxRequestStatus.value == Status.ERROR) {
                return Center(child: Text("Error loading listings"));
              } else if (homeVM.rxRequestStatus.value == Status.COMPLETED) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:
                      homeVM.homeListFilterList.value.listings?.data?.length ??
                          0,
                  itemBuilder: (context, index) {
                    final estate =
                        homeVM.homeListFilterList.value.listings!.data![index];
                    // return HomeEstateTileWidget(homeEstateApiModel: estate);
                    return HomeEstateTileWidget();
                  },
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
