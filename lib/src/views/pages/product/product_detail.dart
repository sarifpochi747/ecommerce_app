// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/src/views/widgets/app_icon.dart';
import 'package:ecommerce_app/src/views/widgets/icon_and_text_widget.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //icon
          //image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: 320,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("lib/assets/images/food.jpg")
                )
              ),
            ),
          ),
          Positioned(
              top: 20,
              left: 20,
              right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AppIcon(icon: Icons.arrow_back_ios_new_rounded),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            )
          ),
      
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: _detailsProduct()
          ),
      
        ]
      
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)
          ),
          color: Colors.grey[300]
        ),
        child: _button(),
      ),
    );
  }



  Widget _detailsProduct(){
    return 
    Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        ),
        color: Colors.white
      ),
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
                  List.generate(5, (index) => Icon(Icons.star_rate_rounded ,size: 18,color: Colors.green,) ),
              ),
              SizedBox(width: 10),
              Text(
                "5.0",
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
          ),
          SizedBox(height: 15,),
          Text("Introduce",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.normal),),
          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
            ,style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.normal),
          )

        ],
      ),
    );
  }

  Widget _button(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.remove),
              SizedBox(width: 15,),
              Text("0",style: TextStyle(fontSize: 18,color: Colors.black)),
              SizedBox(width: 15,),
              Icon(Icons.add)
            ],
          ),
        ),

        Container(
          decoration: BoxDecoration(
            color:Colors.green[300],
            borderRadius: BorderRadius.circular(20)
          ),
          padding: EdgeInsets.all(20),
          child: Row(
            children:<Widget> [
              Text("\$0.08 Add to cart",style: TextStyle(fontSize: 18,color: Colors.white))
            ],
          ),
        )

      ],
    );
  }

}
