import 'package:doxbox/utilities/colors.dart';
import 'package:doxbox/utilities/styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController nameDetailController;
  final TextEditingController contentDetailController;
  const CustomTextField({
    Key? key,
    required this.nameDetailController,
    required this.contentDetailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: Converts.c8),
          child: TextField(
            controller: nameDetailController,
            style: TextStyles.t16.apply(color: Colors.white),
            decoration: InputDecoration(
              label: Text(
                'Enter the Detail Name',
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
            controller: contentDetailController,
            style: TextStyles.t16.apply(color: Colors.white),
            decoration: InputDecoration(
              label: Text(
                'Enter the Detail Content',
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
      ],
    );
  }
}
