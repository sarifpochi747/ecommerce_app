// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/src/views/pages/product/product_list.dart';
import 'package:ecommerce_app/src/views/widgets/icon_and_text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.fromLTRB(10,15,10,0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sarif Pochi",
                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                  ),
                  Text("Thailand",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.green[200]
                ),
                width: 50,
                height: 50,
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 29,
                ),
              ),
            ],
          ),
          ProductList(),
          Container(
           // color: Colors.amber,
            padding: EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Popular",style: TextStyle(fontSize: 21)),
                SizedBox(width: 10,),
                Text(".",style: TextStyle(fontSize: 20,color: Colors.grey)),
                SizedBox(width: 10,),
                Text("Food pairing",style: TextStyle(fontSize: 15,color: Colors.grey)),
              ],
            ),
          ),
          Expanded(
            
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return _cartPopular();
                },
              ),
            ),
          )
        ],
      ),
    );
  }



  Widget _cartPopular(){
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          //image section
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage("https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?cs=srgb&dl=pexels-ella-olsson-1640772.jpg&fm=jpg"),
                fit: BoxFit.cover
              )
            ),
          ),

          // text section
          Expanded(
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width*0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight:Radius.circular(10),
                  bottomRight: Radius.circular(10)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10,10,10,10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Nutritous fruit meal",style: TextStyle(fontSize: 18,color: Colors.black)),
                    Text("With chiness characteristics",style: TextStyle(fontSize: 13,color: Colors.grey),),
                                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(icon: Icons.circle_sharp, text: "Normal", colors: Colors.grey, iconColor: Colors.yellow),
                        SizedBox(width: 10,),
                        IconAndTextWidget(icon: Icons.location_on, text: "1.7km", colors: Colors.grey, iconColor: Colors.green),
                        SizedBox(width: 10,),
                        IconAndTextWidget(icon: Icons.access_time, text: "32min", colors: Colors.grey, iconColor: Colors.red)
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ) ;
  }
}