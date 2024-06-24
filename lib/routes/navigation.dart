import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:writeapp/features/auth/presentation/auth_screen.dart';
import 'package:writeapp/features/auth/presentation/login_screen.dart';
import 'package:writeapp/features/auth/presentation/register_screent.dart';
import 'package:writeapp/features/auth/presentation/reset_password_screen.dart';
import 'package:writeapp/features/document/controller/document_controller.dart';
import 'package:writeapp/features/document/presentation/create_document_screen.dart';
import 'package:writeapp/features/document/presentation/document_screen.dart';
import 'package:writeapp/features/home/presentation/home_screen.dart';
import 'package:writeapp/features/search/presentation/search_screen.dart';
import 'package:writeapp/features/settings/presentation/settings_screen.dart';
import 'package:writeapp/routes/routes.dart';

///Nav Initialization
var routes = [
  GetPage(name: Routes.login, page: () => const LoginScreen()),
  GetPage(name: Routes.register, page: () => const RegisterScreen()),
  GetPage(name: Routes.auth, page: () => const AuthScreen()),
  GetPage(name: Routes.resetPassword, page: () => const ResetPasswordScreen()),
  GetPage(name: Routes.home, page: () => HomeScreen()),
  GetPage(
      name: Routes.createDocument, page: () => const CreateDocumentScreen()),
  GetPage(name: Routes.document, page: () => DocumentScreen()),
  GetPage(name: Routes.search, page: () => SearchScreen()),
  //  GetPage(
  //     name: Routes.search,
  //     page: () => SearchScreen(),
  //     binding: BindingsBuilder(() {
  //       Get.lazyPut<DocumentController>(() => DocumentController());
  //     }),
  //   ),
  GetPage(name: Routes.settings, page: () => const SettingsScreen())
];
