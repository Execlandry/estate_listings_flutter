import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstateDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the arguments
    final arguments = Get.arguments;

    // Check if arguments is null or not in the expected format
    if (arguments == null || !(arguments is Map<String, dynamic>) || !arguments.containsKey('id')) {
      // Handle the case where arguments are null or not in the expected format
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Invalid arguments'),
        ),
      );
    }

    // Extract the 'id' from arguments
    final String id = arguments['id'];

    // Now you can use the 'id' as needed
    return Scaffold(
      appBar: AppBar(
        title: Text('Estate Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Estate ID: $id',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
