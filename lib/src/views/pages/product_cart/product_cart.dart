// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProductCart extends StatefulWidget {
  const ProductCart({super.key});

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Ultraboot Shoes",
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),
          ),
          Text(
            "Men's Running",
            style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 18),
          ),
          Row(
            children: [
              Text(
                "79.00",
                style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 18),
              ),
              Text(
                "Colors",
                style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 18),
              )
            ],
          ),
        ],        
      ),
    );
  }
}