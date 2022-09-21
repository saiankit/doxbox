import 'package:doxbox/providers/fieldsProvider.dart';
import 'package:doxbox/providers/navBarProvider.dart';
import 'package:doxbox/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Converts.c24),
      child: SafeArea(
        child: Consumer<FieldsProvider>(builder: (context, fieldsProvider, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: Converts.c8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add a new Document / Card',
                      style: TextStyles.t16,
                    ),
                    Consumer<BottomNavBarProvider>(
                        builder: (context, navBarViewModel, _) {
                      return ElevatedButton(
                        onPressed: () {
                          fieldsProvider.addDocument();
                          navBarViewModel.changeNavBarSelectedIndex(0);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Nord.orange,
                          // minimumSize: Size.fromHeight(Converts.c48),
                        ),
                        child: Text(
                          'SAVE',
                          style: TextStyles.t20.apply(color: Colors.white),
                        ),
                      );
                    })
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Converts.c8),
                child: ElevatedButton(
                  onPressed: () {
                    fieldsProvider.addField();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Nord.nord1,
                    minimumSize: Size.fromHeight(Converts.c48),
                  ),
                  child: Text(
                    'ADD MORE FIELDS',
                    style: TextStyles.t16.apply(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Converts.c8),
                child: TextField(
                  style: TextStyles.t16.apply(color: Colors.white),
                  controller: fieldsProvider.documentDetailController,
                  textInputAction: TextInputAction.next,
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
                  textInputAction: TextInputAction.next,
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
                  textInputAction: TextInputAction.next,
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
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: false,
                  itemCount: fieldsProvider.detailFields.length,
                  itemBuilder: (BuildContext context, int index) {
                    return fieldsProvider.detailFields[index];
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
