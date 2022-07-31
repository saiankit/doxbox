import 'package:doxbox/services/migrate.dart';
import 'package:doxbox/utilities/assets.dart';
import 'package:doxbox/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ExportDataScreen extends StatelessWidget {
  const ExportDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Nord.bg,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'EXPORT DATA',
          style: TextStyles.t16,
        ),
        backgroundColor: Nord.bg,
        elevation: 0,
        leading: IconButton(
          icon: AppAssets.back,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(Converts.c24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'YOUR DATA WILL BE EXPORTED AND STORED IN THE DIRECTORY',
              style: TextStyles.t16,
            ),
            Text(
              'Documents',
              style: TextStyles.t16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Converts.c8),
              child: ElevatedButton(
                onPressed: () {
                  Migrate.generateCSV();
                  Fluttertoast.showToast(
                      msg: "Exported Successfully",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Nord.nord1,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  Navigator.of(context).pop();
                },
                child: Text(
                  'SAVE',
                  style: TextStyles.t20.apply(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Nord.orange,
                  minimumSize: Size.fromHeight(Converts.c48),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
