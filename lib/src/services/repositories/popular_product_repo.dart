import 'package:ecommerce_app/src/utils/app_contants.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/src/services/api_client.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});


  Future<Response> getPopularProductList() async{
    return await apiClient.fetchData(AppConstants.POPULAR_PRODUCT_URL);
  
  }
  
}
