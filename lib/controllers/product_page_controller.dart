import 'package:get/get.dart';

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
}

