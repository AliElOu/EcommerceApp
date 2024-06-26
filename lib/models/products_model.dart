class ProductsModel {
  final String name, description, image;
  final double rating;
  final int price, id, quantity;
  bool isFavorit;

  ProductsModel({
    required this.description,
    required this.rating,
    required this.quantity,
    required this.image,
    required this.name,
    required this.price,
    required this.isFavorit,
    required this.id,
  });

  Map<String, dynamic> toJson() => {'id': id, 'price': price};

  factory ProductsModel.fromJson(json) {
    return ProductsModel(
      id: (json['id_product']),
      name: json['name'],
      image: json['image'],
      description: json['description'],
      isFavorit: json['isFavorit'] == 1 ? true : false,
      price: (json['price']),
      rating: double.parse(json['rating']),
      quantity: (json['quantity']),
    );
  }

  factory ProductsModel.fromJson2(json) {
    return ProductsModel(
      id: (json['id_product']),
      name: json['name'],
      image: json['image'],
      description: json['description'],
      isFavorit: json['isFavorit'] == "1" ? true : false,
      price: (json['price']),
      rating: double.parse(json['rating']),
      quantity: (json['product_quantity']),
    );
  }
}
