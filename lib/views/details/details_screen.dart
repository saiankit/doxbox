import 'package:clipboard/clipboard.dart';
import 'package:doxbox/models/detail.dart';
import 'package:doxbox/models/document.dart';
import 'package:doxbox/services/database.dart';
import 'package:doxbox/utilities/assets.dart';
<<<<<<< HEAD
import 'package:doxbox/utilities/theme.dart';
=======
import 'package:doxbox/utilities/colors.dart';
import 'package:doxbox/utilities/styles.dart';
>>>>>>> 0c18ed551f9c8acdbc44ebf282f4139dcad2ef46
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailsScreen extends StatelessWidget {
  final Document document;
  final int index;
  const DetailsScreen({Key? key, required this.document, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Nord.bg,
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            document.title,
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
          actions: [
            IconButton(
              onPressed: () {
                AppDatabase.deleteDocument(document);
                Navigator.of(context).pop();
              },
              icon: AppAssets.delete,
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(Converts.c24),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailWidget(detail: document.primaryDetail),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: false,
                    itemCount: document.details.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DetailWidget(detail: document.details[index]);
                    },
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

class DetailWidget extends StatelessWidget {
  final Detail detail;
  const DetailWidget({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Converts.c12),
<<<<<<< HEAD
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(detail.name, style: TextStyles.t12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(detail.content, style: TextStyles.t20),
              IconButton(
                onPressed: () {
                  FlutterClipboard.copy(detail.content).then(
                    (value) => Fluttertoast.showToast(
                        msg: "Copied to Clipboard",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Nord.nord1,
                        textColor: Colors.white,
                        fontSize: 16.0),
                  );
                },
                icon: AppAssets.copy,
              ),
            ],
          ),
        ],
=======
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(detail.name, style: TextStyles.t12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(detail.content, style: TextStyles.t20),
                IconButton(
                  onPressed: () {
                    FlutterClipboard.copy(detail.content).then(
                      (value) => Fluttertoast.showToast(
                          msg: "Copied to Clipboard",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Nord.nord1,
                          textColor: Colors.white,
                          fontSize: 16.0),
                    );
                  },
                  icon: AppAssets.copy,
                ),
              ],
            ),
          ],
        ),
>>>>>>> 0c18ed551f9c8acdbc44ebf282f4139dcad2ef46
      ),
    );
  }
}
