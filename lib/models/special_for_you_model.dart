class SpecialForYouModel {
  final String name,imagePath;
  final int brands;

  SpecialForYouModel({
    required this.name,
    required this.imagePath,
    required this.brands,
  });

}

List<SpecialForYouModel> specialList = [
    SpecialForYouModel(
      name: "Smartphone",
      imagePath: "https://github.com/GDG-Guelmim/flutter_bootcamp_2023_ecommerce_app/blob/main/assets/images/Image%20Banner%202.png?raw=true",
      brands : 18,
    ),
    SpecialForYouModel(
      name: "Fashion",
      imagePath: "https://github.com/GDG-Guelmim/flutter_bootcamp_2023_ecommerce_app/blob/main/assets/images/Image%20Banner%203.png?raw=true",
      brands : 24,
    ),
  ];