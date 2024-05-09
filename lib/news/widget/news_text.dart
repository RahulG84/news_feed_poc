// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class NewsText extends StatelessWidget {
  String? title;
  double? fontSize;
  FontWeight? fontWeight;
  Color? textColor;
  TextAlign? textAlign;
  TextOverflow? textOverflow;
  double? height;
  String? fontFamily;
  NewsText({
    Key? key,
    required this.title,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.textAlign,
    this.textOverflow,
    this.height,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      textAlign: textAlign,
      overflow: textOverflow,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
        height: height,
        fontFamily: fontFamily,
      ),
    );
  }
}
