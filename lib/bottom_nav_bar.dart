import 'package:doxbox/providers/navBarProvider.dart';
import 'package:doxbox/utilities/colors.dart';
import 'package:doxbox/views/migrate/settings_screen.dart';
import 'package:doxbox/views/upload/upload_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

import 'views/home/home_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarscreenstate();
}

class _BottomNavBarscreenstate extends State<BottomNavBarScreen> {
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const UploadScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: Consumer<BottomNavBarProvider>(
        builder: (context, navBarViewModel, _) {
          return Scaffold(
            backgroundColor: Nord.bg,
            body: _widgetOptions.elementAt(navBarViewModel.navBarSelectedIndex),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Nord.bbg,
              selectedItemColor: Nord.orange,
              unselectedItemColor: Neutrals.n5,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: navBarViewModel.changeNavBarSelectedIndex,
              currentIndex: navBarViewModel.navBarSelectedIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.plusCircle),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.settings),
                  label: 'Home',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
