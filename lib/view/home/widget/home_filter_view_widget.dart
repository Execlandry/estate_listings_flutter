import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef void FilterCallback(Map<String, dynamic> filters); // Define a callback type

class HomeFilterViewWidget extends StatelessWidget {
  final VoidCallback onClearFilters; // Callback for clear button
  final FilterCallback onApplyFilters; // Callback for apply filters button

  HomeFilterViewWidget({
    required this.onClearFilters,
    required this.onApplyFilters,
  });

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
    onClearFilters(); // Call the callback function
  }

  void applyFilters() {
    // Create a Map to hold the filter values
    Map<String, dynamic> filters = {
      'priceFrom': priceFromController.text,
      'priceTo': priceToController.text,
      'areaFrom': areaFromController.text,
      'areaTo': areaToController.text,
      'beds': selectedBeds.value,
      'baths': selectedBaths.value,
    };
    // Call the callback function with the filter values
    onApplyFilters(filters);
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
                  style: TextStyle(color: Colors.black),
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
                child: Text('Filter', style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
