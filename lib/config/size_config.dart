import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SizeConfig {
  static double _screenWidth = 0;
  static double _screenHeight = 0;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double textMultiplier = 0;
  static double imageSizeMultiplier = 0;
  static double heightMultiplier = 0;
  static double widthMultiplier = 0;

  void init(BoxConstraints constraints) {
    _screenWidth = constraints.maxWidth;
    _screenHeight = constraints.maxHeight;
    _blockWidth = _screenWidth / 50.5854791898;
    _blockHeight = _screenHeight / 112.4121759774;
    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;
  }
}

class SizeConfigWrapper extends StatefulWidget {
  final Widget child;
  const SizeConfigWrapper({Key? key, required this.child}) : super(key: key);

  @override
  State<SizeConfigWrapper> createState() => _SizeConfigWrapperState();
}

class _SizeConfigWrapperState extends State<SizeConfigWrapper> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig().init(constraints);
        return MaterialApp(
          theme: ThemeData(
            fontFamily: 'Roboto',
          ),
          debugShowCheckedModeBanner: false,
          home: widget.child,
        );
      },
    );
  }
}
