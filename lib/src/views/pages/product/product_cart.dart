// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/src/models/product_model.dart';
import 'package:ecommerce_app/src/views/widgets/icon_and_text_widget.dart';
import 'package:flutter/material.dart';

class ProductCart extends StatefulWidget {
  final String imgPath = "lib/assets/images/food.jpg";
  final int position;
  final ProductModel popularProduct;
  const ProductCart({super.key, required this.position, required this.popularProduct});
  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 220,
          margin: EdgeInsets.fromLTRB(0,0,15,0),
          //width: MediaQuery.of(context).size.width*0.8,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            image: DecorationImage(
                fit: BoxFit.cover,
              image: AssetImage(widget.imgPath)              
            )
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.fromLTRB(30, 0, 30, 30),
            height: MediaQuery.of(context).size.height*0.15,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(221, 247, 235, 235),
                    offset: Offset(0,5),
                    blurRadius:4
                  )
                ]
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Chiness Side",
                    style: TextStyle(
                      fontSize: 23
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Wrap(
                        children: 
                          List.generate(widget.popularProduct.stars, (index) => Icon(Icons.star_rate_rounded ,size: 18,color: Colors.green,) ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        widget.popularProduct.stars.toString(),
                        style: TextStyle(color: Colors.grey,fontSize: 13),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "1287",
                        style: TextStyle(color: Colors.grey,fontSize: 13),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "comment",
                        style: TextStyle(color: Colors.grey,fontSize: 13),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndTextWidget(icon: Icons.circle_sharp, text: "Normal", colors: Colors.grey, iconColor: Colors.yellow),
                      SizedBox(width: 15,),
                      IconAndTextWidget(icon: Icons.location_on, text: "1.7km", colors: Colors.grey, iconColor: Colors.green),
                      SizedBox(width: 15,),
                      IconAndTextWidget(icon: Icons.access_time, text: "32min", colors: Colors.grey, iconColor: Colors.red)
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }





}
