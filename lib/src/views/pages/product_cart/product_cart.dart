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
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width*0.6,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                offset: Offset(1, 1),
                blurRadius: 0.6,
                spreadRadius: 1
              )
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(widget.img))
                  ),
                ),
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
                        SizedBox(
                          width: 10,
                        ),
                        ChoiceChip(label: Text(""), selected: selected,visualDensity: VisualDensity.compact,selectedColor: Colors.black,)
                      ],
                    )
                  ],
                ),
              ],        
            ),
          ),
        ),
      ),
    );
  }
}