import 'package:flutter/material.dart';

import 'constants.dart';

class bottomButton extends StatelessWidget {
  late VoidCallback onPressed;
  late String text;

  bottomButton({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onPressed,
        child: Center(
          child: Text(
            text,
            style: kNumSmallTextStyle,
          ),
        ),
      ),
      margin: EdgeInsets.only(top: 10),
      height: kBottomButtomHeight,
      color: Color(0xFFEB1555),
    );
  }
}
