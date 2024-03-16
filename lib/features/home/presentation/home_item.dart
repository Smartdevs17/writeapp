import 'package:flutter/material.dart';
import 'package:writeapp/utils/theme/theme.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      height: 195,
      decoration: BoxDecoration(
          color: subTextColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
