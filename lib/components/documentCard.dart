import 'package:clipboard/clipboard.dart';
import 'package:doxbox/models/document.dart';
import 'package:doxbox/models/fakedoc.dart';
import 'package:doxbox/utilities/colors.dart';
import 'package:doxbox/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DocumentCard extends StatelessWidget {
  final Document document;
  const DocumentCard({Key? key, required this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Converts.c16),
      child: Container(
        height: Converts.c104,
        decoration: BoxDecoration(
          color: Nord.nord3,
          borderRadius: BorderRadius.all(Radius.circular(Converts.c8)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Converts.c16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    document.title,
                    style: TextStyles.t12.apply(
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FeatherIcons.heart,
                      size: Converts.c16,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    document.primaryDetail.content,
                    style: TextStyles.t20.apply(
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      FlutterClipboard.copy(document.primaryDetail.content)
                          .then(
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
