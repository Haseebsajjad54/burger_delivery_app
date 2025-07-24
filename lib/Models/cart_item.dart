import 'food.dart';

class CartItem{
  Food food;
  List<Addon> addons;
  int quantity;

  CartItem({required this.food,required this.addons, this.quantity=1});

  double get itemTotalPrice{
    double addonsPrice=addons.fold(0, (sum,addons) => sum+addons.price);
    return (food.price+addonsPrice)*quantity;
  }
}