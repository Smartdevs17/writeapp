import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:writeapp/common/model/api_response_model.dart';
import 'package:writeapp/routes/routes.dart';
import 'package:writeapp/services/api_service.dart';
import 'package:writeapp/utils/constants/constants.dart';

class AuthRepository {
  //Login Respository
  static Future<void> login(Map<String, dynamic> body) async {
    final ApiResponseModel response =
        await ApiService.post(path: '/auth/login', body: body);
    if (response.success) {
      sandBox.write(Constants.accessToken, response.data['token']);
      Get.toNamed(Routes.home);
    } else {
      throw 'Check login respository';
    }
  }
}
