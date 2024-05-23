import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Drop extends StatelessWidget {
  final RxString dropdownValue;
  final Function(String?) onChanged;

  const Drop({
    required this.dropdownValue,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => DropdownButton<String>(
          value: dropdownValue.value,
          onChanged: onChanged,
          items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
