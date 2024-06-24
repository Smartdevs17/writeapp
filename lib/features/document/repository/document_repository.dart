import 'package:writeapp/common/model/api_response_model.dart';
import 'package:writeapp/services/api_service.dart';

class DocumentRepository {
  ///Fetch all Documents
  static Future<ApiResponseModel> fetchDocuments() async {
    final ApiResponseModel response = await ApiService.get(path: "documents");
    return response;
  }

  ///Add a new Document
  static Future<ApiResponseModel> createDocument(
      Map<String, dynamic> body) async {
    final ApiResponseModel response =
        await ApiService.post(path: "documents", body: body);
    return response;
  }

  ///Delete Document
  static Future<ApiResponseModel> deleteDocument(int id) async {
    final ApiResponseModel response =
        await ApiService.delete(path: "documents", id: id);
    return response;
  }

  //Get User Documents
  static Future<ApiResponseModel> fetchUserDocuments(
      {required String id}) async {
    final ApiResponseModel response = await ApiService.get(
      path: "documents/user/$id",
    );
    return response;
  }
}
