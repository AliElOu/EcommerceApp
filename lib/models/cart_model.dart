import 'package:flutter_bootcamp/models/products_model.dart';

class CartModel {
  final ProductsModel product;
  final int quantity;

  CartModel({required this.product, required this.quantity});


  Map<String, dynamic> toJson() =>
      {'product': product.toJson(), 'quantity': quantity};

}

List<CartModel> cartList = [];