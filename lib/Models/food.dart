class Food{
  final String name;
  final String imagePath;
  final String description;
  final double price;
  final FoodCategory category;
  List<Addon> availableAddons;

  Food( {required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.category,
    required this.availableAddons
  });

}
enum FoodCategory {
  burger,
  salad,
  sides,
  dessert,
  drinks
}
class Addon{
  String name;
  double price;

  Addon({
    required this.price,
    required this.name
  });
}