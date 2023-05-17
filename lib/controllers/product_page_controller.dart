import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../core/classes/crud.dart';
import '../core/functions/handling_data.dart';
import '../enums/status_request.dart';
import '../models/cart_model.dart';
import '../models/products_model.dart';
import '../remote/Auth/delete_favoris_data.dart';
import '../remote/Auth/insert_favoris_data.dart';
import '../remote/cart_data.dart';

class ProductPageController extends GetxController {
  int selectedImage = 0;
  int selectedQuantity = 0;
  int selectedColor = 0;
  bool isExpanded = false;
  bool isExpandable = false;

  StatusRequest? statusrequest;
  Crud crud = Crud();
  late InsertFavorisData insertfavorisdata = InsertFavorisData(crud);
  late DeleteFavorisData deletefavorisdata = DeleteFavorisData(crud);
  late CartData cartdata = CartData(crud);

  void toggleFavorite(ProductsModel products, BuildContext context,
      [bool sb = true]) async {
    if (products.isFavorit == false) {
      statusrequest = StatusRequest.loading;
      update(["allpage"]);
      var response = await insertfavorisdata.postData(products.id.toString());
      statusrequest = handlingData(response);
      if (statusrequest == StatusRequest.succes) {
        products.isFavorit = !products.isFavorit;
        update();
        update(["allpage"]);
        if (sb) {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.success(
              message:
                  "Ce produit a été ajouté avec succès à votre liste de favorits",
            ),
          );
        }
      } else if (statusrequest == StatusRequest.failure) {}
    } else {
      statusrequest = StatusRequest.loading;
      update(["allpage"]);
      var response = await deletefavorisdata.postData(products.id.toString());
      statusrequest = handlingData(response);
      if (statusrequest == StatusRequest.succes) {
        products.isFavorit = !products.isFavorit;
        update();
        update(["allpage"]);
        if (sb) {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.error(
              message:
                  "Ce produit a été supprimé avec succès à votre liste de favorits",
            ),
          );
        }
      } else if (statusrequest == StatusRequest.failure) {}
    }
    update();
  }

  void selectColor(index) {
    selectedColor = index;
    update();
  }

  void incrementQuantity(quant) {
    if (selectedQuantity < quant) {
      selectedQuantity++;
      update();
    }
  }

  void decrementQuantity() {
    if (selectedQuantity > 0) {
      selectedQuantity--;
      update();
    }
  }

  void toggleTextExpandation() {
    isExpanded = !isExpanded;
    update();
  }

  void changeSelectedImage(int index) {
    selectedImage = index;
    update();
  }

  void addToCart(ProductsModel products, bool isAlready, context) {
    if (selectedQuantity != 0 && !isAlready) {
      cartList.add(CartModel(product: products, quantity: selectedQuantity));
      update();
      Navigator.pop(context);
    }
  }

  void removeFromCart(CartModel cl) {
    cartList.remove(cl);
    update();
  }



  checkout(context) async {
    statusrequest = StatusRequest.loading;
    update();
    var response = await cartdata.postData();
    statusrequest = handlingData(response);
    print(response);
    if (statusrequest == StatusRequest.succes) {
      update();
      cartList.clear();
    }else if(statusrequest == StatusRequest.failure){
      update();
      AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Erreur',
          desc: "Un des produits n'est plus en stock!",
          btnCancelOnPress: () {},
        ).show();
    }
  }
}
