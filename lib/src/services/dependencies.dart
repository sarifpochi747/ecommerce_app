import 'package:ecommerce_app/src/controllers/popular_product_controller.dart';
import 'package:ecommerce_app/src/controllers/recommend_product_controller.dart';
import 'package:ecommerce_app/src/services/api_client.dart';
import 'package:ecommerce_app/src/services/repositories/popular_product_repo.dart';
import 'package:ecommerce_app/src/services/repositories/recommend_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async{

  //api client
  Get.lazyPut(() => ApiClient());

  //repos
  Get.lazyPut(() =>PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() =>RecommendProductRepo(apiClient: Get.find()));

  //controller
  Get.lazyPut(() =>PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() =>RecommendProductController(recommendProductRepo: Get.find()));
}