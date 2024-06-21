import 'package:flutter/material.dart';
import 'package:writeapp/utils/theme/theme.dart';

class CreateDocumentScreen extends StatelessWidget {
  const CreateDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController authorController = TextEditingController();
    final TextEditingController countController = TextEditingController();
    final TextEditingController contentController = TextEditingController();

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
                      // Save document logic here
                      String title = titleController.text;
                      String author = authorController.text;
                      int count = int.tryParse(countController.text) ?? 0;
                      String content = contentController.text;

                      // Perform save operation with title, author, count, and content
                      print("Title: $title");
                      print("Author: $author");
                      print("Count: $count");
                      print("Content: $content");
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        color: Color(0xff4CD964),
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Image.asset("assets/images/logo.png"),
                  const Text(
                    "Share",
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: titleController,
                        style: const TextStyle(
                          color: primaryColorDK,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Title',
                          labelStyle: const TextStyle(color: secondaryColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: primaryColorLT,
                          contentPadding: const EdgeInsets.all(16.0),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        controller: authorController,
                        style: const TextStyle(
                          color: primaryColorDK,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Author',
                          labelStyle: const TextStyle(color: secondaryColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: primaryColorLT,
                          contentPadding: const EdgeInsets.all(16.0),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        controller: countController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          color: primaryColorDK,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Count',
                          labelStyle: const TextStyle(color: secondaryColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: primaryColorLT,
                          contentPadding: const EdgeInsets.all(16.0),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        controller: contentController,
                        maxLines: 10,
                        style: const TextStyle(
                          color: primaryColorDK,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Content',
                          labelStyle: const TextStyle(color: secondaryColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: primaryColorLT,
                          contentPadding: const EdgeInsets.all(16.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
