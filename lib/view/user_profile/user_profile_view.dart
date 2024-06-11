import 'package:carousel_slider/carousel_slider.dart';
import 'package:estate_listings/data/response/status.dart';
import 'package:estate_listings/res/colors/app_color.dart';
import 'package:estate_listings/res/components/general_exceptions_widget.dart';
import 'package:estate_listings/res/components/internet_exceptions_widget.dart';
import 'package:estate_listings/res/routes/routes_name.dart';
import 'package:estate_listings/view_models/controller/user_preference/user_preference.dart';
import 'package:estate_listings/view_models/controller/user_profile/user_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  final userProfileController = Get.put(UserProfileViewModel());
  UserPreferences userPreference = UserPreferences();

  @override
  void initState() {
    super.initState();
    userProfileController.userEstatesApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.transparentColor,
      body: Obx(() {
        switch (userProfileController.rxRequestStatus.value) {
          case Status.LOADING:
            return Center(
              child: CircularProgressIndicator(),
            );
          case Status.ERROR:
            if (userProfileController.error.value == 'No Internet:') {
              return InternetExceptionsWidget(
                onPress: () {
                  userProfileController.refreshApi();
                },
              );
            } else {
              return GeneralExceptionsWidget(
                onPress: () {
                  userProfileController.refreshApi();
                },
              );
            }
          case Status.COMPLETED:
            return Container(
              // color: Colors.deepPurple[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Your Listings',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // UserListingsWidget(),
                  Expanded(
                    child: Center(
                      child: CarouselSlider.builder(
                        itemCount: userProfileController
                            .userListingsList.value.listings!.data!.length,
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          final info = userProfileController
                              .userListingsList.value.listings!.data![index];
                          return Card(
                            child: Column(
                              children: [
                                ButtonBar(
                                  alignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.toNamed(RouteName.offerView);
                                      },
                                      child: Text(
                                          "Offers(${info.offersCount.toString()})"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                          "Images(${info.imagesCount.toString()})"),
                                    ),
                                  ],
                                ),

                                Container(
                                  height: 300,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.network(
                                      'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fGFkaWRhc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
                                      fit: BoxFit.cover),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Center(
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "₹${info.price.toString()}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        info.city.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        info.street.toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey.shade600),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${info.beds.toString()} Beds",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.grey.shade600),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "${info.baths.toString()} Baths",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.grey.shade600),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "${info.area.toString()} m²",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.grey.shade600),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // SizedBox(height: 20),
                              ],
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: 500,
                          // Adjust height as needed
                          viewportFraction: 0.8,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          // autoPlay: true,
                          disableCenter: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          default:
            return Container();
        }
      }),
    );
  }
}
