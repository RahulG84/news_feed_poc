import 'package:flutter/material.dart';

class NewsButton extends StatelessWidget {
  Widget icon;
  void Function()? onPress;
  Color? iconColor;
  NewsButton({Key? key, required this.icon, this.onPress, this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onPress,
      color: iconColor,
    );
  }
}