

// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/src/views/pages/product/product_detail.dart';
import 'package:get/get.dart';

class Routers{

  static const String initial = "/";
  static const String productDetail = "/product-detail";


  static List<GetPage> routers = [
    GetPage(
      name: productDetail, 
      page: ()=>ProductDetail(),
      transition: Transition.leftToRight
    )
  ];
  
}