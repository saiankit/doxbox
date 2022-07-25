import 'package:clipboard/clipboard.dart';
import 'package:doxbox/bottom_nav_bar.dart';
import 'package:doxbox/components/documentCard.dart';
import 'package:doxbox/models/detail.dart';
import 'package:doxbox/models/document.dart';
import 'package:doxbox/providers/database.dart';
import 'package:doxbox/providers/fieldsProvider.dart';
import 'package:doxbox/providers/navBarProvider.dart';
import 'package:doxbox/utilities/colors.dart';
import 'package:doxbox/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../models/fakedoc.dart';

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
            icon: Icon(FeatherIcons.chevronLeft),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                AppDatabase.deleteDocument(index);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  PageTransition(
                    curve: Curves.easeInOutSine,
                    type: PageTransitionType.fade,
                    child: BottomNavBarScreen(),
                  ),
                );
              },
              icon: Icon(FeatherIcons.trash2),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Converts.c24),
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
                  icon: Icon(
                    FeatherIcons.copy,
                    size: Converts.c24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
