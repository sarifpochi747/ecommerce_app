// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProductCart extends StatefulWidget {
  final String id;
  final String price;
  final String name;
  final String category;
  final String img;
  const ProductCart({
    Key? key,
    required this.id,
    required this.price,
    required this.name,
    required this.category,
    required this.img,
  }) : super(key: key);
  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  var selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        children: [
          Text(
            widget.name,
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),
          ),
          Text(
            widget.category,
            style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 18),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.price,
                style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 20),
              ),
              Row(
                children: [
                  Text(
                    "Colors",
                    style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 18),
                  ),
                  ChoiceChip(label: Text(""), selected: selected,visualDensity: VisualDensity.compact,selectedColor: Colors.black,)
                ],
              )
            ],
          ),
        ],        
      ),
    );
  }
}