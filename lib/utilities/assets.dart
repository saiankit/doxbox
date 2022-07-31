import 'package:doxbox/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';

class AppAssets {
  static Icon heart = Icon(
    FeatherIcons.heart,
    size: Converts.c20,
    color: Colors.white,
  );
  static Icon home = Icon(
    FeatherIcons.home,
    size: Converts.c24,
    color: Colors.white,
  );
  static Icon add = Icon(
    FeatherIcons.plusCircle,
    size: Converts.c24,
    color: Colors.white,
  );
  static Icon settings = Icon(
    FeatherIcons.settings,
    size: Converts.c24,
    color: Colors.white,
  );
  static Icon copy = Icon(
    FeatherIcons.copy,
    size: Converts.c24,
    color: Colors.white,
  );

  static Icon back = Icon(
    FeatherIcons.chevronLeft,
    size: Converts.c24,
    color: Colors.white,
  );

  static Icon delete = Icon(
    FeatherIcons.trash2,
    size: Converts.c24,
    color: Colors.white,
  );

  static Icon search = Icon(
    FeatherIcons.search,
    size: Converts.c24,
    color: Neutrals.n5,
  );

  static Widget heartFilled = SvgPicture.asset(
    'assets/icons/heart_filled.svg',
    height: Converts.c20,
    width: Converts.c20,
    color: Nord.orange,
  );

  static Icon import = Icon(
    FeatherIcons.download,
    size: Converts.c24,
    color: Colors.white,
  );

  static Icon export = Icon(
    FeatherIcons.upload,
    size: Converts.c24,
    color: Colors.white,
  );
}
