import 'package:flutter_bootcamp/models/products_model.dart';

class CartModel {
  final ProductsModel product;
  final int quantity;

  CartModel({required this.product, required this.quantity});
}

List<CartModel> cartList = [
  CartModel(product: productsList[0],quantity: 2),
  CartModel(product: productsList[1],quantity: 1),
];