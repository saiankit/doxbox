import 'dart:io';
import 'package:doxbox/models/detail.dart';
import 'package:doxbox/models/document.dart';
import 'package:doxbox/services/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:uuid/uuid.dart';

class Migrate {
  static Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  static Future<bool> exportFile(String csvData, String fileName) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = (await getExternalStorageDirectory())!;
          String newPath = "";
          List<String> paths = directory.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/" + folder;
            } else {
              break;
            }
          }
          newPath = newPath + "/Documents";
          directory = Directory(newPath);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }

      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        print(fileName);
        File exportFile = File(directory.path + "/$fileName");
        await exportFile.writeAsString(csvData);

        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  static void generateCSV() async {
    var fileName = DateTime.now().day.toString() +
        DateTime.now().hour.toString() +
        DateTime.now().second.toString();

    var res = await exportFile(CSV.generate(), "$fileName.csv");

    print(res);
  }

  static void loadCsvFromStorage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['csv'],
      type: FileType.custom,
    );
    PlatformFile file = await result!.files.first;

    var _listData = await CSV.parse(file);

    for (var i = 1; i <= _listData.length; i++) {
      List<dynamic> doc = _listData[i];
      var title = doc[1];
      var isFavorite = doc[2] == 'false' ? false : true;
      Detail primaryDetail = Detail(name: doc[3], content: doc[4]);
      List<Detail> details = [];
      print(doc.length);
      if (doc.length > 4) {
        for (int j = 5; j < doc.length - 1; j += 2) {
          print(j);
          Detail anotherDetail = Detail(name: doc[j], content: doc[j + 1]);
          details.add(anotherDetail);
        }
      }
      Document document = Document(
        id: const Uuid().v1(),
        title: title,
        isFavorite: isFavorite,
        primaryDetail: primaryDetail,
        details: details,
      );

      // AppDatabase.addDocument(document);
    }
  }
}
