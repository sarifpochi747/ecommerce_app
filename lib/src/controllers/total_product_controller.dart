// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';

class TotalProductController extends GetxController{
  int _quatity = 0;



  int get(){
    return _quatity;
  }
  void increaseQuantity(){
    _quatity++;
    update();
  }

  void decreaseQuantity(){
    if(_quatity>=1){
      _quatity--;
    }
    update();
  }
}