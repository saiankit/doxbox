import 'package:doxbox/models/document.dart';
import 'package:hive/hive.dart';

class AppDatabase {
  static List<Document> getDocuments() {
    final documentsBox = Hive.box('documents');
    List<Document> documents = [];
    for (int i = 0; i < documentsBox.length; ++i) {
      documents.add(documentsBox.getAt(i));
    }
    return documents;
  }

  static void addDocument(Document document) {
    final documentsBox = Hive.box('documents');
    documentsBox.add(document);
  }

  static void deleteDocument(int index) {
    final documentsBox = Hive.box('documents');
    documentsBox.deleteAt(index);
  }
}
