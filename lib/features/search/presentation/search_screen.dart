import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:writeapp/common/widgets/bottom_bar.dart';
import 'package:writeapp/common/widgets/search_widget.dart';
import 'package:writeapp/common/widgets/title_widget.dart';
import 'package:writeapp/features/document/controller/document_controller.dart';
import 'package:writeapp/features/document/presentation/document_details_screen.dart';
import 'package:writeapp/features/document/presentation/document_item.dart';

class SearchScreen extends StatelessWidget {
  final DocumentController _documentController = Get.find();

  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Search Results"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              // SearchWidget(
              //   onSearchChanged: _documentController.searchDocuments,
              // ),
              const SizedBox(height: 20.0),
              Expanded(
                child: Obx(() {
                  if (_documentController.loading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (_documentController.searchResults.isEmpty) {
                    return const Center(
                      child: Text(
                        "No documents found.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    );
                  } else {
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: _documentController.searchResults.length,
                      itemBuilder: (context, index) {
                        final document =
                            _documentController.searchResults[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(() =>
                                DocumentDetailsScreen(document: document));
                          },
                          child: DocumentItem(
                            createdAt: document.createdAt,
                            title: document.title,
                            count: document.count,
                          ),
                        );
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(activeIndex: 1),
    );
  }
}
