import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:writeapp/features/document/model/document_model.dart';
import 'package:writeapp/utils/theme/theme.dart';

class DocumentDetailsScreen extends StatelessWidget {
  final DocumentModel document;
  const DocumentDetailsScreen({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
          child: SingleChildScrollView(
            // Wrap the Column with SingleChildScrollView
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        "assets/images/back.png",
                        scale: 3,
                      ),
                    ),
                    Image.asset(
                      "assets/images/logo.png",
                      color: secondaryColor,
                    ),
                    const Text(
                      "Share",
                      style: TextStyle(
                          color: primaryColorDK,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        document.title,
                        style: const TextStyle(
                            color: primaryColorDK,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0),
                      ),
                      Text(
                        "by ${document.author}",
                        style: const TextStyle(
                            color: secondaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        document.content,
                        style: const TextStyle(
                          color: primaryColorDK,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          letterSpacing: sqrt1_2,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
