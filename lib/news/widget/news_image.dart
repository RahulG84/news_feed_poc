// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class NewsImage extends StatelessWidget {
  String? imageUrl;
  double? imageHeight;
  double? imageWidth;
  NewsImage({Key? key, this.imageUrl, this.imageHeight, this.imageWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl!,
      fit: BoxFit.cover,
      height: imageHeight,
      width: imageWidth,
    );
  }
}
