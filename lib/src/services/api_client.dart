

// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  final String appBaseUrl;
  late String token;
  late Map<String,String> mainHeaders;
  ApiClient({
    required this.appBaseUrl,
  }){
    baseUrl = appBaseUrl;
    mainHeaders = {
      "Content-type" : "application/json; charset=UTF-8",
      "Authorization" : "Bearer $token"
    };
  }



  Future<Response> getData (String url) async{
    try {
      Response response = await get(url);
      return response;
    } catch (e) {
      return Response(statusCode: 400,statusText:e.toString());
    }
  }

}
