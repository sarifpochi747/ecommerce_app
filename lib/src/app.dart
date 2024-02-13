
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/src/Provider/mian_screen_provider.dart';
import 'package:ecommerce_app/src/views/pages/cartpage/cartpage.dart';
import 'package:ecommerce_app/src/views/pages/home/homepage.dart';
import 'package:ecommerce_app/src/views/pages/profilepage/profilepage.dart';
import 'package:ecommerce_app/src/views/share/bottom_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  List<Widget>  pageList = const [
    HomePage(),
    CartPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
  return Consumer<MainScreenNotifier>(builder: (_,mainScreen,__){
      return Scaffold(
      backgroundColor: Colors.white30,
      bottomNavigationBar:SafeArea(
        
        child: Padding(padding: EdgeInsets.all(15),
          child: Container(
            padding: EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16)
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavWidget(icon: Ionicons.home,Ontap: (){
                  mainScreen.set(0);
                }),
                BottomNavWidget(icon: Ionicons.search,Ontap: (){
                  mainScreen.set(1);
                }),
                BottomNavWidget(icon: Ionicons.planet,Ontap: (){
                  mainScreen.set(2);
                }),
                BottomNavWidget(icon: Ionicons.card,Ontap: (){
                  mainScreen.set(3);
                }),
                BottomNavWidget(icon: Ionicons.person,Ontap: (){

                }),
              ],
            ),
          ),  
        ),
      ),
      body: SafeArea(
        child: pageList.elementAt(mainScreen.get())
        )
      );
    }
  );
  } 
}

