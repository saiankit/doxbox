import 'package:doxbox/components/documentCard.dart';
import 'package:doxbox/providers/fieldsProvider.dart';
import 'package:doxbox/providers/navBarProvider.dart';
import 'package:doxbox/utilities/colors.dart';
import 'package:doxbox/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

import '../../models/fakedoc.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Converts.c24),
      child: SafeArea(
        child: Consumer<FieldsProvider>(builder: (context, fieldsProvider, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: Converts.c8),
                child: Text(
                  'Add a new Document / Card',
                  style: TextStyles.t16,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Converts.c8),
                child: TextField(
                  style: TextStyles.t16.apply(color: Colors.white),
                  controller: fieldsProvider.documentDetailController,
                  decoration: InputDecoration(
                    label: Text(
                      'Enter the Document Name',
                      style: TextStyles.t16,
                    ),
                    filled: true,
                    fillColor: Nord.nord2,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Converts.c8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Converts.c8),
                child: TextField(
                  style: TextStyles.t16.apply(color: Colors.white),
                  controller: fieldsProvider.primaryNameDetailController,
                  decoration: InputDecoration(
                    label: Text(
                      'Enter the Primary Detail Name',
                      style: TextStyles.t16,
                    ),
                    filled: true,
                    fillColor: Nord.nord2,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Converts.c8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Converts.c8),
                child: TextField(
                  style: TextStyles.t16.apply(color: Colors.white),
                  controller: fieldsProvider.primaryContentDetailController,
                  decoration: InputDecoration(
                    label: Text(
                      'Enter the Primary Content',
                      style: TextStyles.t16,
                    ),
                    filled: true,
                    fillColor: Nord.nord2,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Converts.c8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: false,
                  itemCount: fieldsProvider.detailFields.length,
                  itemBuilder: (BuildContext context, int index) {
                    return fieldsProvider.detailFields[index];
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: Converts.c24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        fieldsProvider.addField();
                      },
                      icon: Icon(
                        FeatherIcons.plusCircle,
                        size: Converts.c24,
                        color: Nord.nord4,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: Converts.c16),
                child: Consumer<BottomNavBarProvider>(
                    builder: (context, navBarViewModel, _) {
                  return ElevatedButton(
                    onPressed: () {
                      fieldsProvider.addDocument();
                      navBarViewModel.changeNavBarSelectedIndex(0);
                    },
                    child: Text(
                      'SAVE',
                      style: TextStyles.t20.apply(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Nord.orange,
                      minimumSize: Size.fromHeight(Converts.c48),
                    ),
                  );
                }),
              ),
            ],
          );
        }),
      ),
    );
  }
}
