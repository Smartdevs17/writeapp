import 'package:flutter/material.dart';
import 'package:writeapp/utils/theme/theme.dart';
import 'package:intl/intl.dart';

class DocumentItem extends StatelessWidget {
  final DateTime createdAt;
  final String title;
  final int count;
  const DocumentItem(
      {super.key,
      required this.createdAt,
      required this.title,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      height: 195,
      decoration: const BoxDecoration(
        color: primaryColorLT,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                formatDate(createdAt.toString()),
                style: const TextStyle(
                    color: Color(0xff2F2E2B),
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                title.substring(0, 10),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20,
                    color: primaryColorDK,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "$count Pages",
                style: const TextStyle(
                    color: Color(0xff2F2E2B),
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ]),
      ),
    );
  }

  String formatDate(String dateString) {
    final dateTime = DateTime.parse(dateString);
    final formatter = DateFormat('d MMMM yyyy');
    return formatter.format(dateTime);
  }
}
