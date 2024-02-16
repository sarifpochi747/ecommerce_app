
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/src/Provider/mian_screen_provider.dart';
import 'package:ecommerce_app/src/views/pages/cartpage/cartpage.dart';
import 'package:ecommerce_app/src/views/pages/home/homepage.dart';
import 'package:ecommerce_app/src/views/pages/product/product_detail.dart';
import 'package:ecommerce_app/src/views/pages/profilepage/profilepage.dart';
import 'package:ecommerce_app/src/views/widgets/bottom_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

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
  return Consumer<MainScreenNotifier>(builder: (_,mainScreen,__){
      return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 245, 245),
      bottomNavigationBar: SafeArea(child: _bottomNavigationBar(mainScreen)),
      
      body: SafeArea(
        child: ProductDetail()
        )
      );
    }
  );
  } 



  Widget _bottomNavigationBar(MainScreenNotifier mainScreenNotifier){
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavWidget(icon: Ionicons.home,Ontap: (){
            mainScreenNotifier.set(0);
          }),
    
          BottomNavWidget(icon: Ionicons.card,Ontap: (){
            mainScreenNotifier.set(1);
          }),
          BottomNavWidget(icon: Ionicons.person,Ontap: (){
            mainScreenNotifier.set(2);
    
          }),
        ],
      ),
    );
  }
  
}

