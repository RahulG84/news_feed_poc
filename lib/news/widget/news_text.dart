import 'package:flutter/material.dart';

class NewsText extends StatelessWidget {
  String title;
  double? fontSize;
  FontWeight? fontWeight;
  Color? textColor;
  TextAlign? textAlign;
  TextOverflow? textOverflow;
  NewsText({
    Key? key,
    required this.title,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.textAlign,
    this.textOverflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      overflow: textOverflow,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
      ),
    );
  }
}