import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsList extends StatelessWidget {
  int? itemCount;
  Widget? Function(BuildContext, int) itemWidget;
  ScrollController? controller;
  NewsList({Key? key, this.itemCount, required this.itemWidget,this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: itemWidget,
      controller: controller,
    );
  }
}
