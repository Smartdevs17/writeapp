import 'package:get/get_navigation/get_navigation.dart';
import 'package:writeapp/features/auth/presentation/auth_screen.dart';
import 'package:writeapp/features/auth/presentation/login_screen.dart';
import 'package:writeapp/features/auth/presentation/register_screent.dart';
import 'package:writeapp/features/auth/presentation/reset_password_screen.dart';
import 'package:writeapp/features/document/presentation/create_document_screen.dart';
import 'package:writeapp/features/document/presentation/document_details_screen.dart';
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
  GetPage(name: Routes.home, page: () => const HomeScreen()),
  GetPage(
      name: Routes.createDocument, page: () => const CreateDocumentScreen()),
  GetPage(name: Routes.document, page: () => const DocumentScreen()),
  GetPage(
      name: Routes.documentDetails, page: () => const DocumentDetailsScreen()),
  GetPage(name: Routes.search, page: () => const SearchScreen()),
  GetPage(name: Routes.settings, page: () => const SettingsScreen())
];
