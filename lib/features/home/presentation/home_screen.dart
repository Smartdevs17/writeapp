import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:writeapp/common/widgets/bottom_bar.dart';
import 'package:writeapp/common/widgets/search_widget.dart';
import 'package:writeapp/common/widgets/title_widget.dart';
import 'package:writeapp/features/home/presentation/home_item.dart';
import 'package:writeapp/routes/routes.dart';
import 'package:writeapp/utils/theme/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                      if (i == 0) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.createDocument);
                          },
                          child: Container(
                            height: 195,
                            decoration: const BoxDecoration(
                                color: subTextColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Image.asset("assets/images/plus.png"),
                          ),
                        );
                      } else {
                        return const HomeItem();
                      }
                    }),
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: const BottomBar(activeIndex: 0),
    );
  }
}
