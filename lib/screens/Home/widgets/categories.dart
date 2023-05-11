import 'package:flutter/material.dart';
import '../../../models/categories_model.dart';
import 'categories_icon_button.dart';

class Categories extends StatelessWidget {
  final List<CategoriesModel> categorieslist;
  const Categories({super.key, required this.categorieslist});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Medicine & Vitamins by Category",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                fontFamily: "Kanit",
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 100,
            child: ListView.builder(
                itemCount: categoriesModel.length,
                padding: const EdgeInsets.symmetric(horizontal: 22),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CustomCategoryIconButton(
                      iconPath: categorieslist[index].image,
                      title: categorieslist[index].name);
                }),
          )
        ],
      ),
    );
  }
}
