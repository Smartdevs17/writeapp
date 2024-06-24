import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:writeapp/common/widgets/bottom_bar.dart';
import 'package:writeapp/common/widgets/search_widget.dart';
import 'package:writeapp/common/widgets/title_widget.dart';
import 'package:writeapp/features/document/controller/document_controller.dart';
import 'package:writeapp/features/document/presentation/document_details_screen.dart';
import 'package:writeapp/features/document/presentation/document_item.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  final DocumentController _documentController = Get.put(DocumentController());

  @override
  void initState() {
    super.initState();
    _documentController.onInit();
  }

  @override
  void dispose() {
    _documentController.dispose();
    super.dispose();
  }

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
                const SearchWidget(),
                const SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: _documentController.documents.length,
                    itemBuilder: (context, i) {
                      if (_documentController.loading.value) {
                        // Display a loading indicator at the end of the list
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => DocumentDetailsScreen(
                                document: _documentController.documents[i]));
                          },
                          child: DocumentItem(
                            createdAt:
                                _documentController.documents[i].createdAt,
                            title: _documentController.documents[i].title,
                            count: _documentController.documents[i].count,
                          ),
                        );
                      }
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
