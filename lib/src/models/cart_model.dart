import 'dart:convert';



class CartModel {
  int? id;
  String? name;
  double? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;

  
  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExist,
    this.time,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'img': img,
      'quantity': quantity,
      'isExist': isExist,
      'time': time,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id']?.toInt(),
      name: map['name'],
      price: map['price']?.toInt(),
      img: map['img'],
      quantity: map['quantity']?.toInt(),
      isExist: map['isExist'],
      time: map['time'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) => CartModel.fromMap(json.decode(source));
}
