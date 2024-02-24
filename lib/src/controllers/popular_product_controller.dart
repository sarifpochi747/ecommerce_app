

// ignore_for_file: prefer_final_fields

import 'package:ecommerce_app/src/models/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/src/services/repositories/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  bool _isLoading = true;
  List<dynamic> _popularProductList = [];

  //constructor
  PopularProductController({required this.popularProductRepo});

  bool get isLoading => _isLoading;
  List<dynamic> get popularProductList => _popularProductList;


  Future<void> getPopularProductList() async{
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode == 200){
      _popularProductList.clear();
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoading = false;
      update();

    }
  }



}
