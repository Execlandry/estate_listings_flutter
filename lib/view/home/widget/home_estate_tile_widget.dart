import 'package:carousel_slider/carousel_slider.dart';
import 'package:estate_listings/res/assets/image_assets.dart';
import 'package:flutter/material.dart';

class HomeEstateTileWidget extends StatelessWidget {
  final String city;
  final String street;
  final String beds;
  final String baths;
  final String area;
  final String price;
  final List<String>? imagePaths;

  const HomeEstateTileWidget({
    Key? key,
    required this.city,
    required this.street,
    required this.beds,
    required this.baths,
    required this.area,
    required this.price,
    this.imagePaths,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 200,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: imagePaths != null && imagePaths!.isNotEmpty
                ? CarouselSlider.builder(
                    itemCount: imagePaths!.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      final imagePath = imagePaths![index];
                      return FadeInImage.assetNetwork(
                        placeholder:
                            ImageAssets.house1,
                        image: imagePath,
                        height: 140,
                        fit: BoxFit.cover,
                        imageErrorBuilder: (context, error, stackTrace) {
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
                    options: CarouselOptions(
                      height: 160,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      autoPlay: true,
                      viewportFraction: 0.8,
                    ),
                  )
                : SizedBox(
                    height: 160, // Match the height of the CarouselSlider
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(ImageAssets.noImageAvailable),
                          height: 100, 
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 20),
                        Text("No image available"),
                      ],
                    ),
                  ),
          ),
          SizedBox(height: 5),
          Center(
            child: Column(
              children: [
                Text(
                  "₹$price",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${city[0].toUpperCase() + city.substring(1).toLowerCase()}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "${street[0].toUpperCase()+street.substring(1).toLowerCase()}",
                  textAlign: TextAlign.center, // Align street text to center
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (beds.isNotEmpty)
                      Text(
                        "$beds Beds",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    if (beds.isNotEmpty) SizedBox(width: 5),
                    if (baths.isNotEmpty)
                      Text(
                        "$baths Baths",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    if (baths.isNotEmpty) SizedBox(width: 5),
                    if (area.isNotEmpty)
                      Text(
                        "$area m²",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
