// ignore_for_file: prefer_final_fields, unused_field, avoid_print


import 'package:ecommerce_app/src/controllers/cart_controller.dart';
import 'package:ecommerce_app/src/models/product_model.dart';
import 'package:ecommerce_app/src/utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/src/services/repositories/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  bool _isLoading = true;
  List<dynamic> _popularProductList = [];
  int _quantity = 0;
  int _cartItem = 0;
  late CartController _cart;

  //constructor
  PopularProductController({required this.popularProductRepo});



  bool get isLoading => _isLoading;
  List<dynamic> get popularProductList => _popularProductList;
  int get quantity => _quantity;
  int get cartItem => _cartItem;  


  Future<void> getPopularProductList() async{

    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode == 200){
      _popularProductList.clear();
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoading = false;
      update();

    }
  }

  void initProduct(CartController cart){
    _quantity = 0;
    _cart = cart;
  }

  void incrementQuantity(){

    if(_quantity >AppConstants.MAX_PRODUCT_CART){
      Get.snackbar("Item count", "You can't add more",
        colorText: Colors.white,
        backgroundColor: Colors.green
      );
    }
    else
    {
      _quantity ++;
    }
    update();
  }

  void decrementQuantity(){
    if(_quantity<=0){
      Get.snackbar("Item count", "You can't reduce more",
        colorText: Colors.white,
        backgroundColor: Colors.red
      );
    }
    else{
      _quantity --;
    }
    update();
  }



  void addItemToCart(ProductModel product){
    if(_quantity >0){
      _cart.addItemToCart(product, _quantity);
      Get.snackbar("add to the cart", "add item in to the cart success",
        colorText: Colors.white,
        backgroundColor: Colors.green
      );
      _cartItem += _quantity;
      _quantity = 0;
      print(_cartItem);

    }
    update();
  }


}
