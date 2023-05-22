import 'package:flutter/material.dart';
import '../../../models/categories_model.dart';
import '../../Category/category_products_list.dart';
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
              "Médicaments et vitamines par catégorie",
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
                itemCount: categorieslist.length,
                padding: const EdgeInsets.symmetric(horizontal: 22),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "category",arguments: CategorieProductsArguments(categorieslist[index].name,categorieslist[index].id)),
                    child: CustomCategoryIconButton(
                        iconPath: categorieslist[index].image,
                        title: categorieslist[index].name),
                  );
                }),
          )
        ],
      ),
    );
  }
}
