import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:writeapp/common/widgets/bottom_bar.dart';
import 'package:writeapp/common/widgets/search_widget.dart';
import 'package:writeapp/common/widgets/title_widget.dart';
import 'package:writeapp/features/document/controller/document_controller.dart';
import 'package:writeapp/features/document/presentation/document_details_screen.dart';
import 'package:writeapp/features/document/presentation/document_item.dart';

class DocumentScreen extends StatelessWidget {
  final DocumentController _documentController = Get.put(DocumentController());

  DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleWidget(),
                const SizedBox(
                  height: 20.0,
                ),
                SearchWidget(
                  onSearchChanged: _documentController.searchDocuments,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: _documentController.loading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : _documentController.error.value
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Failed to load documents.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      _documentController.initDocuments();
                                    },
                                    child: const Text("Retry"),
                                  ),
                                ],
                              ),
                            )
                          : _documentController.documents.isEmpty
                              ? const Center(
                                  child: Text(
                                    "No documents available.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                )
                              : GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemCount:
                                      _documentController.documents.length,
                                  itemBuilder: (context, i) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(() => DocumentDetailsScreen(
                                              document: _documentController
                                                  .documents[i],
                                            ));
                                      },
                                      child: DocumentItem(
                                        createdAt: _documentController
                                            .documents[i].createdAt,
                                        title: _documentController
                                            .documents[i].title,
                                        count: _documentController
                                            .documents[i].count,
                                      ),
                                    );
                                  },
                                ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomBar(activeIndex: 1),
      );
    });
  }
}
