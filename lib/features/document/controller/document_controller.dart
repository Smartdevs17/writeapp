import 'package:get/get.dart';
import 'package:writeapp/common/model/api_response_model.dart';
import 'package:writeapp/features/document/model/document_model.dart';
import 'package:writeapp/features/home/repository/home_repository.dart';

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
    final ApiResponseModel response = await HomeRepository.fetchDocuments();
    if (response.success) {
      processDocumentsToState(response.data);
      loading(false);
    } else {
      error(true);
      loading(false);
    }
    update();
  }

  @override
  void onInit() {
    initDcouments();
    super.onInit();
  }
}
