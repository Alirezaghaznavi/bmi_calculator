import 'package:bmi_calculator/constans.dart';
import 'package:flutter/material.dart';

class RightShape extends StatelessWidget {
  final double width;
  const RightShape({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'شاخص منفی',
          style: TextStyle(
            fontFamily: defultFontFamily,
            color: Colors.red,
          ),
        ),
        SizedBox(width: 5),
        AnimatedContainer(
          duration: Duration(milliseconds: 800),
          width: width,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
            ),
            color: redColor,
          ),
        ),
      ],
    );
  }
}
