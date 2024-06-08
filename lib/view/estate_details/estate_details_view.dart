import 'package:estate_listings/data/response/status.dart';
import 'package:estate_listings/res/assets/image_assets.dart';
import 'package:estate_listings/res/components/general_exceptions_widget.dart';
import 'package:estate_listings/res/components/internet_exceptions_widget.dart';
import 'package:estate_listings/view_models/controller/estate_details/estate_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:estate_listings/res/colors/app_color.dart';
import 'package:estate_listings/res/components/custom_box.dart';
import 'package:get/get.dart';

class EstateDetailsView extends StatefulWidget {
  @override
  State<EstateDetailsView> createState() => _EstateDetailsViewState();
}

class _EstateDetailsViewState extends State<EstateDetailsView> {
  final String id = Get.arguments['id'];
  final estateDetailsVM = Get.put(EstateDetailsViewModel());

  @override
  void initState() {
    super.initState();
    estateDetailsVM.estateDetailsApi(id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            switch (estateDetailsVM.rxRequestStatus.value) {
              case Status.LOADING:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case Status.ERROR:
                if (estateDetailsVM.error.value == 'No Internet:') {
                  return InternetExceptionsWidget(
                    onPress: () {
                      estateDetailsVM.refreshApi(id);
                    },
                  );
                } else {
                  return GeneralExceptionsWidget(
                    onPress: () {
                      estateDetailsVM.refreshApi(id);
                    },
                  );
                }
              case Status.COMPLETED:
                var images =
                    estateDetailsVM.estateDetailsList.value.listing?.images ??
                        [];
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      images.isNotEmpty
                          ? CustomBox(
                              width: MediaQuery.of(context).size.width - 32,
                              child: CarouselSlider.builder(
                                itemCount: images.length,
                                options: CarouselOptions(
                                  aspectRatio: 1.5,
                                  enlargeCenterPage: true,
                                  enableInfiniteScroll: false,
                                ),
                                itemBuilder: (BuildContext context, int index,
                                    int realIdx) {
                                  return FadeInImage.assetNetwork(
                                    placeholder: ImageAssets.house1,
                                    image: images[index].src ?? "",
                                    height: 140,
                                    fit: BoxFit.cover,
                                    imageErrorBuilder:
                                        (context, error, stackTrace) {
                                      return Center(
                                        child: Icon(
                                          Icons.error_outline,
                                          color: Colors.red,
                                          size: 40,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            )
                          : SizedBox(
                              height: 160,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          ImageAssets.noImageAvailable),
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(height: 20),
                                    Text("No images available"),
                                  ],
                                ),
                              ),
                            ),
                      SizedBox(height: 20),
                      CustomBox(
                        header: Text("Basic info"),
                        width: MediaQuery.of(context).size.width - 32,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "\$${estateDetailsVM.estateDetailsList.value.listing?.price ?? 0}"),
                            Row(
                              children: [
                                Text(
                                    "${estateDetailsVM.estateDetailsList.value.listing?.beds ?? 0} Beds | "),
                                // SizedBox(width: 10),
                                Text(
                                    "${estateDetailsVM.estateDetailsList.value.listing?.baths ?? 0} Baths | "),
                                // SizedBox(width: 10),
                                Text(
                                    "${estateDetailsVM.estateDetailsList.value.listing?.area ?? 0} m²"),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.pin_drop_outlined,
                                  color: AppColor.redColor,
                                ),
                                Text(
                                    "${estateDetailsVM.estateDetailsList.value.listing?.street ?? ''}, ${estateDetailsVM.estateDetailsList.value.listing?.city ?? ''}"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomBox(
                        header: Text("Monthly Payment"),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text("Interest Rate:"),
                              subtitle:
                                  Text("2.5%"), // Replace with dynamic value
                            ),
                            ListTile(
                              title: Text("Duration:"),
                              subtitle: Text(
                                  "25 years"), // Replace with dynamic value
                            ),
                            ListTile(
                              title: Text("Monthly Payment:"),
                              subtitle:
                                  Text("\$800"), // Replace with dynamic value
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Handle make offer action
                        },
                        child: Text("Make Offer"),
                      ),
                    ],
                  ),
                );
              default:
                return Container();
            }
          }),
        ),
      ),
    );
  }
}
