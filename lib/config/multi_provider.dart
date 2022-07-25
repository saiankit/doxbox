import 'package:doxbox/providers/fieldsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:doxbox/providers/navBarProvider.dart';

class MultiProviderWrapper extends StatelessWidget {
  final Widget child;
  const MultiProviderWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavBarProvider>(
            create: (_) => BottomNavBarProvider()),
        ChangeNotifierProvider<FieldsProvider>(create: (_) => FieldsProvider()),
      ],
      child: child,
    );
  }
}
