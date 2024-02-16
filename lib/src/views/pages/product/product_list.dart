// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/src/views/pages/product/product_cart.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  final PageController _pageController = PageController(viewportFraction: 0.85);
  double _currentPage = 0.0;

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
        Container(
          margin: EdgeInsets.only(top: 10),
          height: MediaQuery.of(context).size.height*0.38,
          width: MediaQuery.of(context).size.width,
          //color: Colors.amber,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            controller: _pageController,
            itemBuilder: (context,position){
            return ProductCart();
          })
        ),
        DotsIndicator(
          dotsCount: 4,
          position: _currentPage.toInt() ,
          decorator: DotsDecorator(
            color: Colors.black87, // Inactive color
            activeColor: Colors.blue,
          ),
        )
      ],
    ) ;
  }
}