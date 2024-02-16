

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color colors;
  final Color iconColor;
  const IconAndTextWidget({super.key, required this.icon, required this.text, required this.colors, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,color: iconColor,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          text,style: TextStyle(fontSize: 13,color: colors),
        )
        
      ],
    );
  }
}