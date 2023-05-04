import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';
import '../models/products_model.dart';

class ProductPageController extends GetxController{
  int selectedImage = 0;
  bool isFavourite = false;
  int selectedQuantity = 0;
  int selectedColor = 0;
  bool isExpanded = false;
  bool isExpandable = false;


  void selectColor(index){
    selectedColor = index;
    update();
  }

  void incrementQuantity(quant){
    if(selectedQuantity < quant){
       selectedQuantity++;
       update();
    }
  }

  void decrementQuantity(){
    if(selectedQuantity > 0){
       selectedQuantity--;
       update();
    }
  }

  void toggleFavorite(ProductsModel products) {
    products.isFavorit = !products.isFavorit;
    update();
  }


  void toggleTextExpandation() {
    isExpanded = !isExpanded;
    update();
  }


  void changeSelectedImage(int index){
    selectedImage = index;
    update();
  }

  void addToCart(ProductsModel products,bool isAlready,context) {
    
    if(selectedQuantity != 0 && !isAlready){
      cartList.add(CartModel(product: products,quantity: selectedQuantity));
      update();
      Navigator.pop(context);
    }
  }

  void removeFromCart(CartModel cl) {
    cartList.remove(cl);
    update();
  }
}

