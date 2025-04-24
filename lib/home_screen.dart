import 'package:flutter/material.dart';

import 'constans.dart';
import 'widgets/left_shape.dart';
import 'widgets/right_shape.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController widthController = TextEditingController();
  final TextEditingController lenghtController = TextEditingController();
  final FocusNode widthFocusNode = FocusNode();
  final FocusNode lenghtFocusNode = FocusNode();
  double resultBMI = 0;
  String resulttext = '';
  bool? greeen;
  double greenWidth = 22;
  double redWidth = 22;
  Color lableColor = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Column(
                      spacing: 5,
                      children: [
                        Text(
                          'راهنما',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'میزان قد(متر) و وزن(کیلوگرم) را در قسمت های مشخص شده وارد کنید',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text('تو چنده ؟ BMI')),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: blackColor,
          fontSize: 20,
          fontFamily: defultFontFamily,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 80,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    focusNode: widthFocusNode,
                    controller: widthController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontFamily: defultFontFamily,
                      fontSize: 25,
                      color: redColor,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'وزن',
                      hintStyle: TextStyle(
                        fontFamily: defultFontFamily,
                        fontSize: 22,
                        color: redColor.withAlpha(120),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 80,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    focusNode: lenghtFocusNode,
                    controller: lenghtController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: defultFontFamily,
                      fontSize: 25,
                      color: redColor,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'قد',
                      hintStyle: TextStyle(
                        fontFamily: defultFontFamily,
                        fontSize: 22,
                        color: redColor.withAlpha(120),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 22),
            ElevatedButton(
              onPressed: () {
                if (lenghtFocusNode.hasFocus || widthFocusNode.hasFocus) {
                  lenghtFocusNode.unfocus();
                  widthFocusNode.unfocus();
                }
                if (widthController.text != '' && lenghtController.text != '') {
                  final lenght = double.parse(lenghtController.text);
                  final weight = double.parse(widthController.text);
                  resultBMI = weight / (lenght * lenght);
                  setState(
                    () {
                      if (resultBMI > 25) {
                        resulttext = 'شما اضافه وزن دارید';
                        redWidth = 270;
                        greenWidth = 22;
                        lableColor = redColor;
                      } else if (resultBMI >= 18.5 && resultBMI <= 25) {
                        redWidth = 22;
                        lableColor = greenColor;
                        greenWidth = 270;
                        resulttext = 'وزن شما نرمال است';
                      } else {
                        resulttext = 'وزن شما کمتر از حد نرمال است';
                        redWidth = 220;
                        lableColor = redColor;
                        greenWidth = 22;
                      }
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'میزان قد و وزن را وارد کنید',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              child: Text(
                '! محاسبه کن',
                style: TextStyle(
                  fontFamily: defultFontFamily,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: blackColor, //chenge
                ),
              ),
            ),
            SizedBox(height: 25),
            Text(
              resultBMI.toStringAsFixed(2),
              style: TextStyle(
                  fontFamily: defultFontFamily,
                  fontSize: 38,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              resulttext,
              style: TextStyle(
                fontFamily: defultFontFamily,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: lableColor,
              ),
            ),
            SizedBox(height: 20),
            RightShape(width: redWidth),
            SizedBox(height: 15),
            LeftShape(width: greenWidth),
          ],
        ),
      ),
    );
  }
}
