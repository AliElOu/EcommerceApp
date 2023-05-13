import 'package:flutter_bootcamp/models/products_model.dart';

class CartModel {
  final ProductsModel product;
  final int quantity;

  CartModel({required this.product, required this.quantity});
}

List<CartModel> cartList = [];