


// ignore_for_file: prefer_final_fields

import 'package:ecommerce_app/src/models/cart_model.dart';
import 'package:ecommerce_app/src/models/product_model.dart';
import 'package:ecommerce_app/src/services/repositories/cart_repo.dart';
import 'package:get/get.dart';

class CartController extends GetxController{

  final CartRepository cartRepository;

  CartController({required this.cartRepository});

  Map<int , CartModel> _items = {};
  Map<int,CartModel> get items=>_items;


  // add to cart
  void addItemToCart(ProductModel productModel,int quantity){

    //check existing product
    if(_items.containsKey(productModel.id)){
      _items.update(productModel.id, (value){
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time:DateTime.now().toString()
        );
      });
    }else{
      _items.putIfAbsent(productModel.id, () => CartModel(
        id: productModel.id,
        name: productModel.name,
        price: productModel.price,
        img: productModel.img,
        quantity: quantity,
        isExist: true,
        time:DateTime.now().toString()

      ));
    }
  }



}