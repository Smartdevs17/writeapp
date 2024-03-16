import 'package:flutter/material.dart';
import 'package:writeapp/common/widgets/search_widget.dart';
import 'package:writeapp/common/widgets/title_widget.dart';
import 'package:writeapp/utils/theme/theme.dart';

class CreateDocumentScreen extends StatelessWidget {
  const CreateDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget(),
          SizedBox(
            height: 20.0,
          ),
          SearchWidget(),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: 165,
            height: 195,
            decoration: BoxDecoration(
                color: subTextColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Image.asset("assets/images/plus.png"),
          )
        ],
      )),
    );
  }
}
