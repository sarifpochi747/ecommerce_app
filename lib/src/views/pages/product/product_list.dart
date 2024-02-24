// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/src/Routers/routers.dart';
import 'package:ecommerce_app/src/controllers/popular_product_controller.dart';
import 'package:ecommerce_app/src/models/product_model.dart';
import 'package:ecommerce_app/src/views/pages/product/product_cart.dart';
import 'package:ecommerce_app/src/views/pages/product/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  final PageController _pageController = PageController(viewportFraction: 0.85);
  double _currentPage = 0.0;
  late List<ProductModel> products;
  
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return 
          Container(
            margin: EdgeInsets.only(top: 10),
            height: MediaQuery.of(context).size.height*0.38,
            width: MediaQuery.of(context).size.width,
            //color: Colors.amber,
            
            child: popularProducts.isLoading? Center(
              
              child: CircularProgressIndicator(
                color: Colors.blue,
                strokeWidth: 10,
              ),
            ):
            GestureDetector(
              onTap: (){
                Get.toNamed(Routers.productDetail);
              },
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularProducts.popularProductList.length,
                controller: _pageController,
                itemBuilder: (context,position){
                return ProductCart(position:position,popularProduct: popularProducts.popularProductList.elementAt(position));
              
              }),
            )
          );
        }),
        
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty ? 1 : popularProducts.popularProductList.length,
            position: _currentPage.toInt() ,
            decorator: DotsDecorator(
              color: Colors.black87, // Inactive color
              activeColor: Colors.blue,
            ),
          );
        })
      ],
    ) ;
  }
}