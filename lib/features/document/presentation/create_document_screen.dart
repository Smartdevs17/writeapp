import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:writeapp/utils/theme/theme.dart';

class CreateDocumentScreen extends StatelessWidget {
  const CreateDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(
                        // color: Color.fromRGBO(76, 217, 100, 100),
                        color: Color(0xff4CD964),
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Image.asset("assets/images/logo.png"),
                const Text(
                  "Share",
                  style: TextStyle(
                      color: secondaryColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: primaryColorLT,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: TextField(
                  maxLines: null,
                  style: const TextStyle(
                    color: primaryColorDK,
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    contentPadding:
                        const EdgeInsets.all(16.0), // Adjust padding as needed
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
