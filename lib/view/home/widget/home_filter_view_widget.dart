import 'package:estate_listings/res/colors/app_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeFilterViewWidget extends StatelessWidget {
  final TextEditingController priceFromController = TextEditingController();
  final TextEditingController priceToController = TextEditingController();
  final TextEditingController areaFromController = TextEditingController();
  final TextEditingController areaToController = TextEditingController();

  final RxString selectedBeds = '1'.obs;
  final RxString selectedBaths = '1'.obs;

  final List<String> bedBathOptions = ['1', '2', '3', '4', '5', '6+'];

  void clearFilters() {
    priceFromController.clear();
    priceToController.clear();
    areaFromController.clear();
    areaToController.clear();
    selectedBeds.value = '1';
    selectedBaths.value = '1';
  }

  void applyFilters() {
    // Implement your filter logic here
    if (kDebugMode) {
      print("Filters applied:");
      print("Price From: ${priceFromController.text}");
      print("Price To: ${priceToController.text}");
      print("Area From: ${areaFromController.text}");
      print("Area To: ${areaToController.text}");
      print("Beds: ${selectedBeds.value}");
      print("Baths: ${selectedBaths.value}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: priceFromController,
                decoration: InputDecoration(
                  labelText: 'Price From',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: priceToController,
                decoration: InputDecoration(
                  labelText: 'Price To',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: areaFromController,
                decoration: InputDecoration(
                  labelText: 'Area From',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: areaToController,
                decoration: InputDecoration(
                  labelText: 'Area To',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: Obx(
                () => DropdownButtonFormField<String>(
                  value: selectedBeds.value,
                  onChanged: (newValue) {
                    selectedBeds.value = newValue!;
                  },
                  decoration: InputDecoration(
                    labelText: 'Beds',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  items: bedBathOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Obx(
                () => DropdownButtonFormField<String>(
                  value: selectedBaths.value,
                  onChanged: (newValue) {
                    selectedBaths.value = newValue!;
                  },
                  decoration: InputDecoration(
                    labelText: 'Baths',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  items: bedBathOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: clearFilters,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Clear',
                  style: TextStyle(color: AppColor.blackColor),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: applyFilters,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Filter',style: TextStyle(color: AppColor.blackColor)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
