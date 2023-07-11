import 'package:flutter/material.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget(
      {Key? key, this.greenTitleColor, this.textSize = 30, this.redTitleColor})
      : super(key: key);

  final Color? greenTitleColor;
  final Color? redTitleColor;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/logo.jpg',
      width: 150,
      height: 150,
    );

    /*Text.rich(TextSpan(style: TextStyle(fontSize: textSize), children: [
      TextSpan(
          text: 'Pro',
          style: TextStyle(
              color: greenTitleColor ?? CustomColors.customSwatchColor)),
      TextSpan(
          text: 'con',
          style: TextStyle(color: redTitleColor ?? CustomColors.customContrastColor)),
    ]));*/
  }
}
