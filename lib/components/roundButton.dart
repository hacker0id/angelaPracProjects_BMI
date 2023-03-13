import 'package:flutter/material.dart';

class RoundButtons extends StatelessWidget {
  final IconData icon;
  final VoidCallback function;
  RoundButtons({required this.icon, required this.function});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: function,
      fillColor: Color(0xFF4C4F5E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      constraints: BoxConstraints.tightFor(height: 56, width: 56),
      elevation: 6,
      child: Icon(icon, size: 25),
    );
  }
}
