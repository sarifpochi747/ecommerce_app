

// ignore_for_file: prefer_final_fields

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


  //constructor
  PopularProductController({required this.popularProductRepo});



  bool get isLoading => _isLoading;
  List<dynamic> get popularProductList => _popularProductList;
  int get quantity => _quantity;
  int get cartItem => _cartItem + _quantity;  


  Future<void> getPopularProductList() async{

    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode == 200){
      _popularProductList.clear();
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoading = false;
      update();

    }
  }

  void initQuantity(){
    _quantity = 0;
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


}
