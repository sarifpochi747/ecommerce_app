
// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

class BottomNavWidget extends StatelessWidget {
  final IconData? icon;
  final void Function()? Ontap;
  const BottomNavWidget({
    Key? key,
    this.icon,
    this.Ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Ontap,
      child: SizedBox(
        height: 36,
        width: 36,
        child: Icon(
          icon,color: Colors.white,
        ),
      ),
    );
  }
}
