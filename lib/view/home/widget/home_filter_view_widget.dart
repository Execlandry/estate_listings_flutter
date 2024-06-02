import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef void FilterCallback(Map<String, dynamic> filters);

class HomeFilterController extends GetxController {
  final TextEditingController priceFromController = TextEditingController();
  final TextEditingController priceToController = TextEditingController();
  final TextEditingController areaFromController = TextEditingController();
  final TextEditingController areaToController = TextEditingController();

  final RxString selectedBeds = ''.obs;
  final RxString selectedBaths = ''.obs;

  final List<String> bedBathOptions = ['', '1', '2', '3', '4', '5', '6+'];

  void clearFilters() {
    priceFromController.clear();
    priceToController.clear();
    areaFromController.clear();
    areaToController.clear();
    selectedBeds.value = '';
    selectedBaths.value = '';
  }

  Map<String, dynamic> get filters => {
        'priceFrom': priceFromController.text.isNotEmpty
            ? priceFromController.text
            : null,
        'priceTo': priceToController.text.isNotEmpty
            ? priceToController.text
            : null,
        'areaFrom': areaFromController.text.isNotEmpty
            ? areaFromController.text
            : null,
        'areaTo': areaToController.text.isNotEmpty
            ? areaToController.text
            : null,
        'beds': selectedBeds.value.isNotEmpty ? selectedBeds.value : null,
        'baths': selectedBaths.value.isNotEmpty ? selectedBaths.value : null,
      };
}

class HomeFilterViewWidget extends StatelessWidget {
  final VoidCallback onClearFilters;
  final FilterCallback onApplyFilters;
  final HomeFilterController controller = Get.put(HomeFilterController());

  HomeFilterViewWidget({
    required this.onClearFilters,
    required this.onApplyFilters,
  });

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
                controller: controller.priceFromController,
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
                controller: controller.priceToController,
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
                controller: controller.areaFromController,
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
                controller: controller.areaToController,
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
                  value: controller.selectedBeds.value,
                  onChanged: (newValue) {
                    controller.selectedBeds.value = newValue!;
                  },
                  decoration: InputDecoration(
                    labelText: 'Beds',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  items: controller.bedBathOptions.map((String value) {
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
                  value: controller.selectedBaths.value,
                  onChanged: (newValue) {
                    controller.selectedBaths.value = newValue!;
                  },
                  decoration: InputDecoration(
                    labelText: 'Baths',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  items: controller.bedBathOptions.map((String value) {
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
                onPressed: () {
                  controller.clearFilters();
                  onClearFilters();
                },
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
                onPressed: () {
                  onApplyFilters(controller.filters);
                },
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
