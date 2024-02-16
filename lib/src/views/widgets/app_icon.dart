// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  const AppIcon({super.key, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50)
      ),
      child: Icon(icon,color: Colors.black,),

    );
  }
}