import 'package:doxbox/services/migrate.dart';
import 'package:doxbox/utilities/assets.dart';
import 'package:doxbox/utilities/theme.dart';
import 'package:doxbox/views/migrate/export_data.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Converts.c24),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Converts.c16),
                  child: GestureDetector(
                    onTap: () {
                      Migrate.loadCsvFromStorage();
                    },
                    child: Container(
                      height: Converts.c80,
                      decoration: BoxDecoration(
                        color: Nord.nord3,
                        borderRadius:
                            BorderRadius.all(Radius.circular(Converts.c8)),
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
                            AppAssets.import,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Converts.c16),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          curve: Curves.easeInOutSine,
                          type: PageTransitionType.fade,
                          child: const ExportDataScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: Converts.c80,
                      decoration: BoxDecoration(
                        color: Nord.nord3,
                        borderRadius:
                            BorderRadius.all(Radius.circular(Converts.c8)),
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
                            AppAssets.export,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Developed by Sai Ankit 🚀',
              style: TextStyles.t16.apply(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
