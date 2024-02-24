

// ignore_for_file: prefer_final_fields

import 'package:ecommerce_app/src/models/product_model.dart';
import 'package:ecommerce_app/src/services/repositories/recommend_product_repo.dart';
import 'package:get/get.dart';

class RecommendProductController extends GetxController {

  List<dynamic> _recommendProduct =[];
  final RecommendProductRepo recommendProductRepo;
  bool _isLoading = true;
  RecommendProductController({required this.recommendProductRepo});


  List<dynamic> get recommendProduct => _recommendProduct;
  bool get isLoading => _isLoading;


  Future<void> getRecommendProductList()async{
    final response = await recommendProductRepo.getRecommendProductList();
    if(response.statusCode == 200){
      _recommendProduct.clear();
      _recommendProduct.addAll(Product.fromJson(response.body).products);
      _isLoading = false;
      update();
    }
    
  }
}