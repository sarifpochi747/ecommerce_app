import 'package:get/get.dart';

import 'package:ecommerce_app/src/services/api_client.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({
    required this.apiClient,
  });


  Future<Response> getPopularProductList() async{
    return apiClient.getData("")
  
  }
  
}
