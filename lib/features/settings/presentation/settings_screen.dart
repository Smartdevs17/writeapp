import 'package:flutter/material.dart';
import 'package:writeapp/common/widgets/bottom_bar.dart';
import 'package:writeapp/utils/theme/theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorDK,
      bottomNavigationBar: const BottomBar(activeIndex: 2),
    );
  }
}
