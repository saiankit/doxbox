import 'package:doxbox/models/document.dart';
import 'package:hive/hive.dart';

class AppDatabase {
  static List<dynamic> getDocuments([String searchText = '']) {
    final documentsBox = Hive.box('documents');

    if (searchText == '') {
      List<dynamic> docs = [];
      docs.addAll(
          documentsBox.values.where((element) => element.isFavorite).toList());
      docs.addAll(
          documentsBox.values.where((element) => !element.isFavorite).toList());
      return docs;
    }

    return documentsBox.values
        .where((document) => document.title.contains(searchText.toLowerCase()))
        .toList();
  }

  static void addDocument(Document document) {
    final documentsBox = Hive.box('documents');
    documentsBox.put(document.id, document);
  }

  static void deleteDocument(Document document) {
    final documentsBox = Hive.box('documents');
    documentsBox.delete(document.id);
  }

  static void toggleFavourite(int index, Document document) {
    final documentsBox = Hive.box('documents');
    final newDocument = Document(
      id: document.id,
      title: document.title,
      primaryDetail: document.primaryDetail,
      details: document.details,
      isFavorite: !document.isFavorite,
    );
    documentsBox.put(document.id, newDocument);
  }
}
