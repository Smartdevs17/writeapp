import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:writeapp/features/auth/controller/token_controller.dart';
import 'package:writeapp/routes/navigation.dart';
import 'package:writeapp/routes/routes.dart';
import 'package:writeapp/utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  Get.put(TokenController()); // Initialize the TokenController

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));

    return GetMaterialApp(
      key: GlobalKey(),
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: "Write_",
      initialRoute: Get.find<TokenController>().isAuthenticated.value
          ? Routes.home
          : Routes.auth,
      getPages: routes,
    );
  }
}
