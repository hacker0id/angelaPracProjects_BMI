import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {required this.clr, required this.cardChild, required this.cardPressed});
  final Color clr;
  final Widget cardChild;
  late VoidCallback cardPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cardPressed,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: clr,
        ),
        child: cardChild,
      ),
    );
  }
}
