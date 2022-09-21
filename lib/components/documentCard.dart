import 'package:clipboard/clipboard.dart';
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

class DocumentCard extends StatelessWidget {
  final Document document;
  final int index;
  const DocumentCard({Key? key, required this.document, required this.index})
      : super(key: key);

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
                    onPressed: () {
                      AppDatabase.toggleFavourite(index, document);
                    },
                    icon: document.isFavorite
                        ? AppAssets.heartFilled
                        : AppAssets.heart,
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
                    icon: AppAssets.copy,
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
