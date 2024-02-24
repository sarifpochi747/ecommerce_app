

import 'package:ecommerce_app/src/services/api_client.dart';
import 'package:ecommerce_app/src/utils/app_contants.dart';
import 'package:get/get.dart';

class RecommendProductRepo extends GetxService{
  final ApiClient apiClient;

  RecommendProductRepo({required this.apiClient});
  


  Future<Response> getRecommendProductList() async {
    return await apiClient.fetchData(AppConstants.RECOMMENED_PRODUCT_URL);
  }
    
}