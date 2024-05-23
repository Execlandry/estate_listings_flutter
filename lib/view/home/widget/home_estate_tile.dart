import 'package:carousel_slider/carousel_slider.dart';
import 'package:estate_listings/models/home/home_estate_api_model.dart';
import 'package:estate_listings/res/colors/app_color.dart';
import 'package:estate_listings/res/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class HomeEstateTile extends StatelessWidget {
  final HomeEstateApiModel homeEstateApiModel;
  const HomeEstateTile({Key? key, required this.homeEstateApiModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 163, 64, 78),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.only(left: 25),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 200, // Fixed width for the CarouselSlider
            child:
            CarouselSlider.builder(
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
            height: 20,
          ),
          Text(
            homeEstateApiModel.name,
            style: TextStyle(
              fontFamily: AppFonts.balettaFont,
              color: AppColor.blackColor,
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$" + homeEstateApiModel.price,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppColor.blackColor),
                ),
                Row(
                  children: [
                    Text(
                      homeEstateApiModel.rating,
                      style: TextStyle(color: AppColor.blackColor),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[800],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
