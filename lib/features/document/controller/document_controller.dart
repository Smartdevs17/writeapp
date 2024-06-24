import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:writeapp/common/model/api_response_model.dart';
import 'package:writeapp/features/document/model/document_model.dart';
import 'package:writeapp/features/document/repository/document_repository.dart';
import 'package:writeapp/routes/routes.dart';
import 'package:writeapp/utils/action/action.dart';
import 'package:writeapp/utils/constants/constants.dart';

class DocumentController extends GetxController {
  RxBool loading = RxBool(false);
  RxBool error = RxBool(false);
  RxList<DocumentModel> documents = RxList<DocumentModel>(<DocumentModel>[]);

  ///Add Documents to State
  void processDocumentsToState(dynamic data) {
    final List docs = data.toList();
    for (int i = 0; i < docs.length; i++) {
      documents.add(
        DocumentModel.fromMap(
          <String, dynamic>{...docs[i]},
        ),
      );
    }
  }

  ///Initialize Dcouments
  Future<void> initDcouments() async {
    loading(true);
    // final ApiResponseModel response = await DocumentRepository.fetchDocuments();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString(Constants.userId);
    print(userId);
    final ApiResponseModel response =
        await DocumentRepository.fetchUserDocuments(id: userId!);
    if (response.success) {
      processDocumentsToState(response.data);
      loading(false);
    } else {
      error(true);
      loading(false);
    }
    update();
  }

  //Create Document Controller(Register New Document to Remote Data Source)
  Future<void> createDocument(Map<String, dynamic> body) async {
    loading(true);
    final ApiResponseModel response =
        await DocumentRepository.createDocument(body);
    if (response.success) {
      showSnackbar(title: 'Success!', message: response.message, error: false);
      documents.add(DocumentModel.fromMap(response.data));
      Get.toNamed(Routes.document);
    } else {
      showSnackbar(title: 'OOPS!', message: response.message, error: true);
      error(true);
      loading(false);
    }
    update();
  }

  //Delete Document From Remote Source and State
  Future<void> deleteDocument(int id) async {
    loading(true);
    final ApiResponseModel response =
        await DocumentRepository.deleteDocument(id);
    if (response.success) {
      showSnackbar(title: 'Success!', message: response.message, error: false);
      documents.removeWhere((element) => element.id == id);
      Get.toNamed(Routes.document);
    } else {
      showSnackbar(title: 'OOPS!', message: response.message, error: true);
    }
    update();
  }

  @override
  void onInit() {
    initDcouments();
    super.onInit();
  }
}
