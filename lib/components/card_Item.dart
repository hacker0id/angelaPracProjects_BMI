import 'package:flutter/material.dart';

class cardItem extends StatelessWidget {
  late String cardItemName;
  late IconData genderIcon;

  cardItem({required this.cardItemName, required this.genderIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80,
        ),
        SizedBox(height: 15),
        Text(
          cardItemName,
          style: TextStyle(color: Color(0xFF8D8E98), fontSize: 18),
        )
      ],
    );
  }
}
