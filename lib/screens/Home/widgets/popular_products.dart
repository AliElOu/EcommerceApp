import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bootcamp/screens/Home/widgets/popular_products_list.dart';

import '../../../models/products_model.dart';
import 'list_header.dart';

class HomeProductsList extends StatelessWidget {
  final String title;
  final List<ProductsModel> lnp;
  final VoidCallback Seemoremethod;
  const HomeProductsList({super.key, required this.title, required this.lnp, required this.Seemoremethod});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        listHeader(title: title,SeeMoreMethod: Seemoremethod,),
        SizedBox(
            width: double.infinity,
            height: 220,
            child: ListView.builder(
              itemCount: lnp.length,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductsList(products: lnp[index],tag : title,height: 140,width:140);
              },
            )),
      ],
    );
  }
}
