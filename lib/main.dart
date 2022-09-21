import 'dart:async';

import 'package:doxbox/bottom_nav_bar.dart';
import 'package:doxbox/config/multi_provider.dart';
import 'package:doxbox/config/size_config.dart';
import 'package:doxbox/models/detail.dart';
import 'package:doxbox/models/document.dart';
import 'package:doxbox/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  final appDocument = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocument.path);
  Hive.registerAdapter(DocumentAdapter());
  Hive.registerAdapter(DetailAdapter());
  runApp(const MultiProviderWrapper(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      Hive.close();
      Hive.box('documents').compact();
      super.dispose();
    }

    return SizeConfigWrapper(
      child: FutureBuilder(
        future: Hive.openBox(
          'documents',
          compactionStrategy: (int total, int deleted) {
            return deleted > 10;
          },
        ),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Something Went Wrong'),
              );
            } else {
              return const BottomNavBarScreen();
            }
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: const Center(
                  child: CircularProgressIndicator(color: Colors.white)),
              backgroundColor: Nord.bg,
            ),
          );
        },
      ),
    );
  }
}
