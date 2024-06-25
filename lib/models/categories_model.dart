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
      id: (json['id_category']) ,
      name: json['category'],
      image: json['image'],
    );
  }
}

