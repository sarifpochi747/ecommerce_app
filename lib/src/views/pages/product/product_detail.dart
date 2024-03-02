// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/src/Routers/routers.dart';
import 'package:ecommerce_app/src/controllers/cart_controller.dart';
import 'package:ecommerce_app/src/controllers/popular_product_controller.dart';
import 'package:ecommerce_app/src/views/widgets/app_icon.dart';
import 'package:ecommerce_app/src/views/widgets/expanable_text_widget.dart';
import 'package:ecommerce_app/src/views/widgets/icon_and_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetail extends StatefulWidget {
  final int productId;
  const ProductDetail({super.key, required this.productId});
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    dynamic product =  Get.find<PopularProductController>().popularProductList[widget.productId]; 
    Get.find<PopularProductController>().initProduct(Get.find<CartController>());
    return Scaffold(
      body: Stack(children: <Widget>[
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
                    image: AssetImage("lib/assets/images/food.jpg"))),
          ),
        ),
        Positioned(top: 20, left: 20, right: 20, child: _iconCartItem()),
        Positioned(
            top: 300, left: 0, right: 0, bottom: 0, child: _detailsProduct(product)),
      ]),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.grey[300]),
        child: _button(product),
      ),
    );
  }

  Widget _iconCartItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        
        GestureDetector(
          onTap: (){
            Get.toNamed(Routers.initial);
          },
          child:AppIcon(icon: Icons.arrow_back_ios_new_rounded),
        ),
        GestureDetector(
          onTap: (){
            Get.toNamed(Routers.carPage);
          },
          child: Stack(
            children: <Widget>[
              AppIcon(icon: Icons.shopping_cart_outlined),
              GetBuilder<PopularProductController>(builder: (popularProductController){
                return Positioned(
                  top: 20,
                  left: 20,
                  right: 0,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Center(
                      child: Text(popularProductController.cartItem.toString(), 
                        style: TextStyle(fontSize: 15, color: Colors.white ,fontWeight: FontWeight.bold)
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        )
      ],
    );
  }

  Widget _detailsProduct(dynamic product) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            product.name,
            style: TextStyle(fontSize: 23),
          ),
          Row(
            children: <Widget>[
              Wrap(
                children: List.generate(
                    product.stars,
                    (index) => Icon(
                          Icons.star_rate_rounded,
                          size: 18,
                          color: Colors.green,
                        )),
              ),
              SizedBox(width: 10),
              Text(
                product.stars.toString(),
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              SizedBox(width: 10),
              Text(
                "1287",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              SizedBox(width: 5),
              Text(
                "comment",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndTextWidget(
                  icon: Icons.circle_sharp,
                  text: "Normal",
                  colors: Colors.grey,
                  iconColor: Colors.yellow),
              SizedBox(
                width: 15,
              ),
              IconAndTextWidget(
                  icon: Icons.location_on,
                  text: "1.7km",
                  colors: Colors.grey,
                  iconColor: Colors.green),
              SizedBox(
                width: 15,
              ),
              IconAndTextWidget(
                  icon: Icons.access_time,
                  text: "32min",
                  colors: Colors.grey,
                  iconColor: Colors.red)
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Introduce",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ExpanableTextWidget(
                  text:product.description
              ),
            ),
          )
        ],
      ),
    );
  }

  

  Widget _button(dynamic product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              decremenButton(),
              SizedBox(
                width: 15,
              ),
              quantityProduct(),
              SizedBox(
                width: 15,
              ),

              // add button
              incrementButton(),            
            ],
          ),
        ),
        addToCartButton(product)
      ],
    );
  }

  GestureDetector addToCartButton(product) {
    return GestureDetector(
        onTap:(){
          Get.find<PopularProductController>().addItemToCart(product);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.green[300],
              borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              GetBuilder<PopularProductController>(builder: (popularProductController){
                return Text("\$${product.price * popularProductController.quantity} | Add to cart",
                  style: TextStyle(fontSize: 18, color: Colors.white)
                );
              })
            ],
          ),
        ),
      );
  }

  GetBuilder<PopularProductController> quantityProduct() {
    return GetBuilder<PopularProductController>(builder: (popularProductController){
              return Text(popularProductController.quantity.toString(), style: TextStyle(fontSize: 18, color: Colors.black));
            });
  }

  GestureDetector incrementButton() {
    return GestureDetector(
              onTap: (){
                Get.find<PopularProductController>().incrementQuantity();
              },
              child: SizedBox(
                child:Icon(Icons.add),
              ),
            );
  }

  GestureDetector decremenButton() {
    return GestureDetector(
              onTap: (){
                Get.find<PopularProductController>().decrementQuantity();
              },
              child: SizedBox(
                child:Icon(Icons.remove),
              ),
            );
  }
}
