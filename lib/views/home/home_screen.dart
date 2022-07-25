import 'package:doxbox/components/documentCard.dart';
import 'package:doxbox/providers/database.dart';
import 'package:doxbox/utilities/styles.dart';
import 'package:doxbox/views/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:page_transition/page_transition.dart';

import '../../models/fakedoc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final documentsBox = Hive.box('documents');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Converts.c24),
      child: SafeArea(
        child: (AppDatabase.getDocuments().isEmpty)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/empty.svg',
                    height: Converts.c200,
                    width: Converts.c296,
                  ),
                  Text(
                    'No Documents Added',
                    style: TextStyles.t24,
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        curve: Curves.easeInOutSine,
                        type: PageTransitionType.fade,
                        child: DetailsScreen(
                          document: documentsBox.getAt(index),
                          index: index,
                        ),
                      ),
                    );
                  },
                  child:
                      DocumentCard(document: AppDatabase.getDocuments()[index]),
                ),
                itemCount: AppDatabase.getDocuments().length,
                shrinkWrap: false,
              ),
      ),
    );
  }
}
