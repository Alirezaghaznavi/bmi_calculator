import 'package:bmi_calculator/constans.dart';
import 'package:bmi_calculator/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: faDefultFontFamily,
      ),
      home: HomeScreen(),
    );
  }
}
