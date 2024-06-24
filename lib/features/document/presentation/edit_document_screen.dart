import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:writeapp/features/document/controller/document_controller.dart';
import 'package:writeapp/features/document/model/document_model.dart';
import 'package:writeapp/utils/theme/theme.dart';

class EditDocumentScreen extends StatefulWidget {
  final DocumentModel document;
  const EditDocumentScreen({super.key, required this.document});

  @override
  _EditDocumentScreenState createState() => _EditDocumentScreenState();
}

class _EditDocumentScreenState extends State<EditDocumentScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController countController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final DocumentController _documentController = Get.find<DocumentController>();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.document.title;
    authorController.text = widget.document.author;
    countController.text = widget.document.count.toString();
    contentController.text = widget.document.content;
  }

  @override
  void dispose() {
    titleController.dispose();
    authorController.dispose();
    countController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void _updateDocument() {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> updatedDocument = {
        'id': widget.document.id,
        'title': titleController.text,
        'author': authorController.text,
        'count': int.parse(countController.text),
        'content': contentController.text,
      };
      _documentController.updateDocument(widget.document.id, updatedDocument);
      // Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: _updateDocument,
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
                const SizedBox(height: 20.0),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: titleController,
                          style: const TextStyle(color: primaryColorDK),
                          decoration: InputDecoration(
                            labelText: 'Title',
                            labelStyle: const TextStyle(color: secondaryColor),
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a title';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller: authorController,
                          style: const TextStyle(color: primaryColorDK),
                          decoration: InputDecoration(
                            labelText: 'Author',
                            labelStyle: const TextStyle(color: secondaryColor),
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an author';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller: countController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: primaryColorDK),
                          decoration: InputDecoration(
                            labelText: 'Count',
                            labelStyle: const TextStyle(color: secondaryColor),
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a count';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Please enter a valid number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller: contentController,
                          maxLines: 10,
                          style: const TextStyle(color: primaryColorDK),
                          decoration: InputDecoration(
                            labelText: 'Content',
                            labelStyle: const TextStyle(color: secondaryColor),
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter content';
                            }
                            return null;
                          },
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
    );
  }
}
