import 'package:flutter/material.dart';
import 'package:estate_listings/res/colors/app_color.dart'; // Import your AppColor file here

class CustomBox extends StatelessWidget {
  final Widget? header;
  final Widget child;
  final double? width;
  final double? height;

  const CustomBox({
    Key? key,
    this.header,
    required this.child,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.greyColor, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     spreadRadius: 1,
        //     blurRadius: 3,
        //     offset: Offset(0, 1), // changes position of shadow
        //   ),
        // ],
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.0),
            child: DefaultTextStyle(
              style: TextStyle(
                color: Colors.grey[500],
                fontWeight: FontWeight.bold,
              ),
              child: header ?? SizedBox.shrink(),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
