import 'dart:io';
import 'dart:math';

import 'package:csv/csv.dart';
import 'package:doxbox/services/database.dart';
import 'dart:convert' show utf8;

import 'package:file_picker/file_picker.dart';

class CSV {
  static String generate() {
    List<List<String>> data = [
      ["S.no", "Title", "isFav", "Primary Detail", "Primary Content"]
    ];

    int maxLength = 0;
    List<dynamic> documents = AppDatabase.getDocuments();
    for (int i = 0; i < documents.length; ++i) {
      maxLength = max(maxLength, documents[i].details.length);
    }

    for (int i = 0; i < maxLength; ++i) {
      data[0].add('Secondary Detail Name ${i + 1}');
      data[0].add('Secondary Detail Content ${i + 1}');
    }

    for (int i = 0; i < documents.length; ++i) {
      data.add([
        (i + 1).toString(),
        documents[i].title,
        documents[i].isFavorite.toString(),
        documents[i].primaryDetail.name,
        documents[i].primaryDetail.content,
      ]);

      for (int j = 0; j < documents[i].details.length; ++j) {
        data[data.length - 1].add(documents[i].details[j].name);
        data[data.length - 1].add(documents[i].details[j].content);
      }
    }
    String csvData = const ListToCsvConverter().convert(data);

    return csvData;
  }

  static Future<List<List>> parse(PlatformFile file) async {
    final input = File(file.path!).openRead();
    final fields = await input
        .transform(utf8.decoder)
        .transform(const CsvToListConverter())
        .toList();

    return fields;
  }
}
