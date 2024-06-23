import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:writeapp/features/document/controller/document_controller.dart';
import 'package:writeapp/utils/theme/theme.dart';
import 'package:writeapp/utils/validator/validator.dart';

class CreateDocumentScreen extends StatefulWidget {
  const CreateDocumentScreen({super.key});

  @override
  State<CreateDocumentScreen> createState() => _CreateDocumentScreenState();
}

class _CreateDocumentScreenState extends State<CreateDocumentScreen> {
  final DocumentController _documentController = Get.put(DocumentController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController countController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  late AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  final bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AbsorbPointer(
            absorbing: _isLoading,
            child: Form(
              key: _formKey,
              autovalidateMode: _autoValidateMode,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            String title = titleController.text;
                            String author = authorController.text;
                            int count = int.tryParse(countController.text) ?? 0;
                            String content = contentController.text;

                            Map<String, dynamic> body = {
                              'title': title,
                              'author': author,
                              'count': count,
                              'content': content
                            };
                            await _documentController.createDocument(body);
                          } else {
                            setState(() {
                              _autoValidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(
                            color: Color(0xff4CD964),
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Image.asset("assets/images/logo.png"),
                      const Text(
                        "Share",
                        style: TextStyle(
                          color: secondaryColor,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: titleController,
                            style: const TextStyle(
                              color: primaryColorDK,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Title',
                              labelStyle:
                                  const TextStyle(color: secondaryColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor: primaryColorLT,
                              contentPadding: const EdgeInsets.all(16.0),
                            ),
                            validator: Validator.documentValidator,
                          ),
                          const SizedBox(height: 20.0),
                          TextFormField(
                            controller: authorController,
                            style: const TextStyle(
                              color: primaryColorDK,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Author',
                              labelStyle:
                                  const TextStyle(color: secondaryColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor: primaryColorLT,
                              contentPadding: const EdgeInsets.all(16.0),
                            ),
                            validator: Validator.documentValidator,
                          ),
                          const SizedBox(height: 20.0),
                          TextFormField(
                            controller: countController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              color: primaryColorDK,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Count',
                              labelStyle:
                                  const TextStyle(color: secondaryColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor: primaryColorLT,
                              contentPadding: const EdgeInsets.all(16.0),
                            ),
                            validator: Validator.documentValidator,
                          ),
                          const SizedBox(height: 20.0),
                          TextFormField(
                            controller: contentController,
                            maxLines: 10,
                            style: const TextStyle(
                              color: primaryColorDK,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Content',
                              labelStyle:
                                  const TextStyle(color: secondaryColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor: primaryColorLT,
                              contentPadding: const EdgeInsets.all(16.0),
                            ),
                            validator: Validator.documentValidator,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
