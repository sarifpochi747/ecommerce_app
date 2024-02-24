class Product {
  int? _typeId;
  int? _offSize;
  int? _totalSize;
  late List<ProductModel> _products;



  Product({
    required typeId,
    required offSize,
    required totalSize,
    required  products,
  }){
    _offSize = offSize;
    _totalSize = totalSize;
    _typeId = typeId;
    _products = products;
  }

  //get products
  List<ProductModel> get products => _products;

  // Named constructor for deserialization
  Product.fromJson(Map<String, dynamic> json)
      : _typeId = json["type_id"],
        _offSize = json["off_size"],
        _totalSize = json["total_size"],
        _products = (json["products"] as List<dynamic>?)
                ?.map((item) => ProductModel.fromJson(item))
                .toList() ??[];

  // Method to convert Product to a Map
  Map<String, dynamic> toJson() {
    return {
      'type_id': _typeId,
      'off_size': _offSize,
      'total_size': _totalSize,
      'products': _products.map((product) => product.toJson()).toList(),
    };
  }
}

class ProductModel {
  int id;
  String name;
  String description;
  double price;
  int stars;
  String img;
  String location;
  String createdAt;
  String updatedAt;
  int typeId;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stars,
    required this.img,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.typeId,
  });

  // Named constructor for deserialization
  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        description = json["description"],
        price = json["price"].toDouble(),
        stars = json["stars"],
        img = json["img"],
        location = json["location"],
        createdAt = json["created_at"],
        updatedAt = json["updated_at"],
        typeId = json["type_id"];

  // Method to convert ProductModel to a Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'stars': stars,
      'img': img,
      'location': location,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'type_id': typeId,
    };
  }
}
