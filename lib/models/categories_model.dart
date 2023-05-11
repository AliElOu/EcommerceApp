class CategoriesModel {
  final int id;
  final String name;
  final String image;

  CategoriesModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoriesModel.fromJson(json) {
    return CategoriesModel(
      id: int.parse(json['id_category']) ,
      name: json['category'],
      image: json['image'],
    );
  }
}

List<CategoriesModel> categoriesModel = [
  CategoriesModel(
      id: 1, name: "Antibiotics", image: "assets/images/img_antibiotics.png"),
  CategoriesModel(
      id: 2, name: "Antiseptics", image: "assets/images/img_antiseptics.png"),
  CategoriesModel(
      id: 3, name: "Cough-Flu", image: "assets/images/img_cough_flu.png"),
  CategoriesModel(
      id: 4, name: "Covid-19", image: "assets/images/img_covid.png"),
  CategoriesModel(
      id: 5, name: "Eigestive", image: "assets/images/img_digestive.png"),
  CategoriesModel(id: 6, name: "Fever", image: "assets/images/img_fever.png"),
  CategoriesModel(id: 7, name: "Skin", image: "assets/images/img_skin.png"),
  CategoriesModel(
      id: 8, name: "Vitamins", image: "assets/images/img_vitamins.png"),
];
