// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  final String imgPath =
      "https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg";

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            NavBar(),
            CartItems(),
            Divider(),
            CartItems(),
            Divider(),
            CartItems(),
            Divider()
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget bottomNavigationBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(15,15,15,0),
      height: 180,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 218, 218, 218),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Subtotal" ,style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.bold
                ),
              ),
              Text("\$ 6997",style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.bold
                ),),
            ],
          ),
          SizedBox(height: 5),  // Add some space between the rows
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Shipping",style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.bold
                ),),
              Text("\$ 1000",style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.bold
                ),),
            ],
          ),          
          SizedBox(height: 5),  // A
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total",style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.bold
                ),),
              Text("\$ 6997",style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.bold
                ),),
            ],
          ),
          SizedBox(height: 10),  // A
          Container(
              height: 60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 179, 110),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Checkout",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 25,
                    color: Colors.black,
                    weight: 600,
                  )
                ],
              ))
        ],
      ),
    );
  }

  Container NavBar() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            )
          ]),
      child: Row(
        children: <Widget>[
          GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 27,
              )),
          Expanded(
            child: Center(
              child: Text(
                "Cart",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container CartItems() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white70),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.imgPath))),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Food Name",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "ID:",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        textDetailProduct("4004"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Price:",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        textDetailProduct("\$400.00"),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[buttonAddRemove(), deleteItemProduct()],
          )
        ],
      ),
    );
  }

  Text textDetailProduct(String text) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Container deleteItemProduct() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Icon(
        Icons.delete_forever_outlined,
        size: 29,
        color: Colors.grey,
      ),
    );
  }

  Container buttonAddRemove() {
    return Container(
      padding: EdgeInsets.fromLTRB(35, 10, 0, 0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.remove_circle_outline_rounded,
            size: 29,
            color: Colors.grey,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "10",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.add_circle_outline_rounded,
            size: 29,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
