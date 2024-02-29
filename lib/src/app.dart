
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/src/views/pages/cartpage/cartpage.dart';
import 'package:ecommerce_app/src/views/pages/home/homepage.dart';
import 'package:ecommerce_app/src/views/pages/profilepage/profilepage.dart';
import 'package:ecommerce_app/src/views/widgets/bottom_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';


// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final List<Widget>  pageList = const [
    HomePage(),
    CartPage(),
    ProfilePage()
  ];
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  backgroundColor: Color.fromARGB(255, 248, 245, 245),
  bottomNavigationBar: SafeArea(child: _bottomNavigationBar()),
  
  body: SafeArea(
    child: HomePage()
    )
  );
  } 



  Widget _bottomNavigationBar(){
    
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavWidget(icon: Ionicons.home,Ontap: (){
            
          }),
    
          BottomNavWidget(icon: Ionicons.card,Ontap: (){
            
          }),
          BottomNavWidget(icon: Ionicons.person,Ontap: (){
          }),
        ],
      ),
    );
  }
  
}

