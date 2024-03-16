import 'package:flutter/material.dart';
import 'package:writeapp/utils/theme/theme.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.name,
      textAlign: TextAlign.center,
      style: const TextStyle(color: primaryColorLT),
      decoration: inputDecoration.copyWith(
        hintText: "Search",
        hintStyle: const TextStyle(
          color: primaryColorLT,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        filled: true,
        fillColor: subTextColor,
      ),
    );
  }
}
