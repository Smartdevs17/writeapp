import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:writeapp/routes/navigation.dart';
import 'package:writeapp/routes/routes.dart';
import 'package:writeapp/utils/constants/constants.dart';
import 'package:writeapp/utils/theme/theme.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey();

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark));

    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder:
            (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
          final SharedPreferences? data = snapshot.data;
          if (snapshot.hasData) {
            final String? userId = data!.getString(Constants.userId);

            String initialRoute =
                userId == '' || userId == null ? Routes.auth : Routes.home;
            return GetMaterialApp(
              key: navigationKey,
              debugShowCheckedModeBanner: false,
              theme: appTheme,
              title: "Write_",
              initialRoute: initialRoute,
              getPages: routes,
            );
          } else {
            return Container();
          }
        });
  }
}
