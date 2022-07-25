import 'package:doxbox/components/documentCard.dart';
import 'package:doxbox/providers/fieldsProvider.dart';
import 'package:doxbox/providers/navBarProvider.dart';
import 'package:doxbox/utilities/colors.dart';
import 'package:doxbox/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

import '../../models/fakedoc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Converts.c24),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: Converts.c16),
              child: Container(
                height: Converts.c80,
                decoration: BoxDecoration(
                  color: Nord.nord3,
                  borderRadius: BorderRadius.all(Radius.circular(Converts.c8)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Converts.c16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'IMPORT DATA',
                        style: TextStyles.t16.apply(
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FeatherIcons.download,
                          size: Converts.c24,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Converts.c16),
              child: Container(
                height: Converts.c80,
                decoration: BoxDecoration(
                  color: Nord.nord3,
                  borderRadius: BorderRadius.all(Radius.circular(Converts.c8)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Converts.c16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'EXPORT DATA',
                        style: TextStyles.t16.apply(
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FeatherIcons.upload,
                          size: Converts.c24,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
