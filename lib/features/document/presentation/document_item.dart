import 'package:flutter/material.dart';
import 'package:writeapp/utils/theme/theme.dart';

class DocumentItem extends StatelessWidget {
  const DocumentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      height: 195,
      decoration: const BoxDecoration(
        color: primaryColorLT,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "12 Febraury, 2024",
                style: TextStyle(
                    color: Color(0xff2F2E2B),
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "Song for the Old Ones",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: primaryColorDK,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "2 Pages",
                style: TextStyle(
                    color: Color(0xff2F2E2B),
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ]),
      ),
    );
  }
}
