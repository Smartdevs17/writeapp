import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:writeapp/common/widgets/bottom_bar.dart';
import 'package:writeapp/common/widgets/search_widget.dart';
import 'package:writeapp/common/widgets/title_widget.dart';
import 'package:writeapp/features/document/presentation/document_item.dart';
import 'package:writeapp/routes/routes.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
              SizedBox(
                height: MediaQuery.of(context)
                    .size
                    .height, // Specify a fixed height or adjust as needed

                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.documentDetails);
                          },
                          child: const DocumentItem());
                    }),
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: const BottomBar(activeIndex: 1),
    );
  }
}
