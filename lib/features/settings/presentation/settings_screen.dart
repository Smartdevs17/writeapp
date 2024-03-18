import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:writeapp/common/widgets/bottom_bar.dart';
import 'package:writeapp/utils/theme/theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isActiveKB = false;
  bool isActiveAS = false;
  bool isActiveSC = false;
  bool isActiveSW = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorDK,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff151515),
        title: const Text(
          "Settings",
          style: TextStyle(
              color: primaryColorLT,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  "WRITTING",
                  style: TextStyle(
                      color: primaryColorLT,
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                height: 250.0,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xff1A1A1A),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Keyboard Shortcut",
                            style: TextStyle(
                                color: primaryColorLT,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.0),
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  isActiveKB = !isActiveKB;
                                });
                              },
                              child: isActiveKB
                                  ? SvgPicture.asset(
                                      "assets/svgs/activeSlide.svg")
                                  : SvgPicture.asset(
                                      "assets/svgs/inactiveSlide.svg"))
                        ],
                      ),
                      const Expanded(
                        child: Divider(
                          color: Color(0xff949494),
                          thickness: 1.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "AutoSave",
                            style: TextStyle(
                                color: primaryColorLT,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.0),
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  isActiveAS = !isActiveAS;
                                });
                              },
                              child: isActiveAS
                                  ? SvgPicture.asset(
                                      "assets/svgs/activeSlide.svg")
                                  : SvgPicture.asset(
                                      "assets/svgs/inactiveSlide.svg"))
                        ],
                      ),
                      const Expanded(
                        child: Divider(
                          color: Color(0xff949494),
                          thickness: 1.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Suggestions",
                            style: TextStyle(
                                color: primaryColorLT,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.0),
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  isActiveSC = !isActiveSC;
                                });
                              },
                              child: isActiveSC
                                  ? SvgPicture.asset(
                                      "assets/svgs/activeSlide.svg")
                                  : SvgPicture.asset(
                                      "assets/svgs/inactiveSlide.svg"))
                        ],
                      ),
                      const Expanded(
                        child: Divider(
                          color: Color(0xff949494),
                          thickness: 1.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Show words",
                            style: TextStyle(
                                color: primaryColorLT,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.0),
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  isActiveSW = !isActiveSW;
                                });
                              },
                              child: isActiveSW
                                  ? SvgPicture.asset(
                                      "assets/svgs/activeSlide.svg")
                                  : SvgPicture.asset(
                                      "assets/svgs/inactiveSlide.svg"))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  "OTHER",
                  style: TextStyle(
                      color: primaryColorLT,
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                height: 250.0,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xff1A1A1A),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Page Setup",
                            style: TextStyle(
                                color: primaryColorLT,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.0),
                          ),
                          SvgPicture.asset(
                            "assets/svgs/arrow_right.svg",
                            width: 15,
                          )
                        ],
                      ),
                      const Expanded(
                        child: Divider(
                          color: Color(0xff949494),
                          thickness: 1.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Share & Export ",
                            style: TextStyle(
                                color: primaryColorLT,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.0),
                          ),
                          SvgPicture.asset(
                            "assets/svgs/arrow_right.svg",
                            width: 15,
                          ),
                        ],
                      ),
                      const Expanded(
                        child: Divider(
                          color: Color(0xff949494),
                          thickness: 1.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Help and Feedback",
                            style: TextStyle(
                                color: primaryColorLT,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.0),
                          ),
                          SvgPicture.asset(
                            "assets/svgs/arrow_right.svg",
                            width: 15.0,
                          )
                        ],
                      ),
                      const Expanded(
                        child: Divider(
                          color: Color(0xff949494),
                          thickness: 1.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Privacy Policy",
                            style: TextStyle(
                              color: primaryColorLT,
                              fontWeight: FontWeight.w400,
                              fontSize: 22.0,
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/svgs/arrow_right.svg",
                            width: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  color: secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(activeIndex: 2),
    );
  }
}
