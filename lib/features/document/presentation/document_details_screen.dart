import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:writeapp/features/document/controller/document_controller.dart';
import 'package:writeapp/features/document/model/document_model.dart';
import 'package:writeapp/features/document/presentation/edit_document_screen.dart';
import 'package:writeapp/utils/theme/theme.dart';

class DocumentDetailsScreen extends StatelessWidget {
  final DocumentModel document;
  const DocumentDetailsScreen({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    final DocumentController _documentController = Get.find();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
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
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => EditDocumentScreen(document: document));
                        },
                        child: const Icon(Icons.edit, color: primaryColorDK),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () async {
                          // Show a confirmation dialog before deleting
                          bool? confirmDelete = await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Confirm Delete"),
                              content: const Text(
                                  "Are you sure you want to delete this document?"),
                              actions: [
                                TextButton(
                                  onPressed: () => Get.back(result: false),
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () => Get.back(result: true),
                                  child: const Text("Delete"),
                                ),
                              ],
                            ),
                          );

                          if (confirmDelete == true) {
                            await _documentController
                                .deleteDocument(document.id);
                          }
                        },
                        child: const Icon(Icons.delete, color: primaryColorDK),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            document.title,
                            style: const TextStyle(
                              color: primaryColorDK,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                            ),
                          ),
                          Text(
                            "by ${document.author}",
                            style: const TextStyle(
                              color: secondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
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
                            ),
                            textAlign: TextAlign.start,
                            maxLines: null,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
