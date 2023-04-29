import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bootcamp/screens/Home/widgets/popular_products_list.dart';

import '../../../models/products_model.dart';
import 'list_header.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        listHeader(title: "Popular Product"),
        SizedBox(
          width: double.infinity,
          height: 220,
          child: ListView.builder(
            itemCount: productsList.length,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            physics:const  BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return ProductsList(Products: productsList[index]);
            },
          )
        ),
        
      ],
      
    );
  }
}

