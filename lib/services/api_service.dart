import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:writeapp/common/model/api_response_model.dart';
import 'package:writeapp/routes/routes.dart';
import 'package:writeapp/utils/action/action.dart';
import 'package:writeapp/utils/constants/constants.dart';

final GetStorage sandBox = GetStorage();

class ApiService {
  //Login Route
  Future<dynamic> login(String email, String password) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> data = <String, dynamic>{
      'email': email,
      'password': password,
    };
    final http.Response response = await http.post(
      Uri.parse('${Constants.baseUrl}/auth/login'),
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
    final dynamic jsonResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      await sandBox.write(Constants.accessToken, jsonResponse["data"]["token"]);
      await prefs.setString(
          Constants.userId, jsonResponse["data"]["ID"].toString());
      return jsonResponse;
    } else {
      return jsonResponse;
    }
  }

  ///Register Route
  Future<dynamic> register(String name, String email, String password) async {
    Map<String, dynamic> data = <String, dynamic>{
      'name': name,
      'email': email,
      'password': password
    };
    final http.Response response = await http.post(
        Uri.parse(
          '${Constants.baseUrl}/auth/register',
        ),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: json.encode(data));
    final dynamic jsonResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      return jsonResponse;
    } else {
      return jsonResponse;
    }
  }

  //HTTP POST CALL
  static Future<ApiResponseModel> post({
    required String path,
    required Map<String, dynamic> body,
    dynamic data,
  }) async {
    final String token = sandBox.read(Constants.accessToken);
    log(token);
    try {
      final http.Response response = await http.post(
          Uri.parse('${Constants.baseUrl}/$path'),
          body: jsonEncode(body),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'bearer $token',
          });
      log(response.body);
      return ApiResponseModel.fromMap(jsonDecode(response.body));
    } catch (e) {
      print(e.toString());
      showSnackbar(
          title: 'OOPS!',
          message: 'An error occurred, please try again!',
          error: true);
      return ApiResponseModel(
          success: false, message: e.toString(), data: <dynamic, dynamic>{});
    }
  }

  ///Logout
  Future<void> logout() async {
    // await get(path: 'auth/logout');
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await sandBox.remove(Constants.accessToken);
    await prefs.remove(Constants.userId);
    Get.offAllNamed(Routes.auth);
  }
}
