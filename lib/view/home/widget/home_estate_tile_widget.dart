import 'package:carousel_slider/carousel_slider.dart';
import 'package:estate_listings/models/home/home_estate_api_model.dart';
import 'package:flutter/material.dart';

class HomeEstateTileWidget extends StatelessWidget {
  final HomeEstateApiModel homeEstateApiModel;
  const HomeEstateTileWidget({Key? key, required this.homeEstateApiModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // ButtonBar(
          //   alignment: MainAxisAlignment.center,
          //   children: [
          //     ElevatedButton(
          //       onPressed: () {
          //         Get.toNamed(RouteName.offerView);
          //       },
          //       child: Text(
          //           "Offers(${info.offersCount.toString()})"),
          //     ),
          //     ElevatedButton(
          //       onPressed: () {},
          //       child: Text(
          //           "Images(${info.imagesCount.toString()})"),
          //     ),
          //   ],
          // ),

          Container(
            height: 200,
            // width: 200,
            //Fixed width for the CarouselSlider
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: CarouselSlider.builder(
              itemCount: homeEstateApiModel.imagePath.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Image.asset(
                  homeEstateApiModel.imagePath[index],
                  height: 140,
                  fit: BoxFit.cover,
                );
              },
              options: CarouselOptions(
                height: 160,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlay: true,
                viewportFraction: 0.8,
              ),
            ),
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
                  "₹",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${homeEstateApiModel.name} -city",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "${homeEstateApiModel.price} -street",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Beds",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey.shade600),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      // "${info.baths.toString()} Baths",
                      "Baths",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey.shade600),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      " m²",
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
  }
}
