import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_1/res/colors/app_color.dart';
import 'package:project_1/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estate Listing',
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.radioCanadaTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
