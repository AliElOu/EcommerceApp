import 'package:flutter/material.dart';

class ProductsModel {
  final String name, description, image;
  final double price, rating;
  final int id, quantity;
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

  factory ProductsModel.fromJson(json) {
    return ProductsModel(
      id: int.parse(json['id_product']),
      name: json['name'],
      image: json['image'],
      description: json['description'],
      isFavorit: json['isFavorit'] == "1" ? true : false,
      price: double.parse(json['price']),
      rating: double.parse(json['rating']),
      quantity: int.parse(json['quantity']),
    );
  }
}

List<ProductsModel> productsList = [
  ProductsModel(
    id: 1,
    image:
        "assets/images/01.png",
    name: "Wireless Controller for PS4™",
    price: 64.99,
    description:
        "Welcome! This website is (quite obviously) a small text generator. It's fairly self-explanatory - you put some text in the first box, and it'll convert it into three different small text for you. To be clear, they're not actually fonts. You can tell they're not fonts because it's possible to copy and paste the.Welcome! This website is (quite obviously) a small text generator. It's fairly self-explanatory - you put some text in the first box, and it'll convert it into three different small text for you. To be clear, they're not actually fonts. You can tell they're not fonts because it's possible to copy and paste the.",
    rating: 4.8,
    isFavorit: false,
    quantity: 5,
  ),
  ProductsModel(
      id: 2,
      image: "assets/images/02.png",
      name: "Nike Sport White - Man Pant",
      price: 50.5,
      description:
          "Welcome! This website is (quite obviously) a small text generator.Welcome! This website is (quite obviously) a small text generator.Welcome! This website",
      rating: 4.1,
      quantity: 5,
      isFavorit: false),
  ProductsModel(
      id: 3,
      image: "assets/images/03.png",
      name: "Gloves XC Omega - Polygon",
      price: 36.55,
      description: "description",
      rating: 4.1,
      isFavorit: true,
      quantity: 5),
  ProductsModel(
      id: 4,
      image: "assets/images/04.png",
      name: "Logitech Head",
      price: 20.20,
      description: "description",
      rating: 4.1,
      isFavorit: true,
      quantity: 7),
];
