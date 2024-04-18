import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  int? itemCount;
  Widget? Function(BuildContext, int) itemWidget;
  NewsList({Key? key, this.itemCount, required this.itemWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: itemWidget,
    );
  }
}
