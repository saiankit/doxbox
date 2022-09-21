import 'package:doxbox/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(
            'assets/images/empty.svg',
            height: Converts.c200,
            width: Converts.c296,
          ),
        ),
        Text(
          'No Documents Added',
          style: TextStyles.t24,
        ),
      ],
    );
  }
}
