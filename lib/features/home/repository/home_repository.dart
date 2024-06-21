import 'package:writeapp/common/model/api_response_model.dart';
import 'package:writeapp/services/api_service.dart';

class HomeRepository {
  ///Fetch all Documents
  static Future<ApiResponseModel> fetchDocuments() async {
    final ApiResponseModel response = await ApiService.get(path: "documents");
    return response;
  }
}
