import 'package:doxbox/components/textField.dart';
import 'package:doxbox/models/detail.dart';
import 'package:doxbox/models/document.dart';
import 'package:doxbox/providers/database.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FieldsProvider extends ChangeNotifier {
  List<List<TextEditingController>> controllers = [];
  List<CustomTextField> detailFields = [];

  final primaryNameDetailController = TextEditingController();
  final primaryContentDetailController = TextEditingController();
  final documentDetailController = TextEditingController();

  void addField() {
    final nameDetailController = TextEditingController();
    final contentDetailController = TextEditingController();

    final detailField = CustomTextField(
        nameDetailController: nameDetailController,
        contentDetailController: contentDetailController);

    controllers.add([nameDetailController, contentDetailController]);
    detailFields.add(detailField);
    notifyListeners();
  }

  void addDocument() {
    final newDocument = Document(
      title: documentDetailController.text,
      primaryDetail: Detail(
          name: primaryNameDetailController.text,
          content: primaryContentDetailController.text),
      details: [],
    );
    for (int i = 0; i < detailFields.length; ++i) {
      newDocument.details.add(Detail(
          name: controllers[i][0].text, content: controllers[i][1].text));
    }
    AppDatabase.addDocument(newDocument);
    controllers = [];
    detailFields = [];
    primaryNameDetailController.clear();
    primaryContentDetailController.clear();
    documentDetailController.clear();
  }
}
