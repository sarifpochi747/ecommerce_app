

// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/src/utils/app_contants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect  {
  late String token = "";
  late Map<String,String> mainHeaders;
  ApiClient(){
    mainHeaders = {
      "Content-type" : "application/json; charset=UTF-8",
      "Authorization" : "Bearer $token"
    };
  }


  Future<Response> fetchData(String path) async {
  try {
    final url = AppConstants.BASE_URL+path;
    print(url);
    final response = await get(url);
    return response;
  } catch (e) {
    print('Error: $e');
    return Response(statusCode: 400, statusText: e.toString());
  }
  }


}
