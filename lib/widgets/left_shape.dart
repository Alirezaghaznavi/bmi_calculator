import 'package:bmi_calculator/constans.dart';
import 'package:flutter/material.dart';

class LeftShape extends StatelessWidget {
  final double width;
  const LeftShape({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 800),
          curve: Easing.linear,
          width: width,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
            ),
            color: greenColor,
          ),
        ),
        SizedBox(width: 5),
        Text(
          'شاخص مثبت',
          style: TextStyle(
            fontFamily: defultFontFamily,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
