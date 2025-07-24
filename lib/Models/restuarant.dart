import 'package:burger_delivery_app/Models/cart_item.dart';
import 'package:flutter/widgets.dart';
import 'package:collection/collection.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier{
  final List<Food> _foodMenu = [

    // BURGERS
    Food(
        name: "Aloha Burger Burger",
        description: "Juicy beef patty with lettuce, tomato,\n and our special sauce",
        price: 12.99,
        imagePath: "assets/Burgers/Aloha_Burger.jpeg",
        category: FoodCategory.burger,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 1.50),
          Addon(name: "Bacon", price: 2.00),
          Addon(name: "Avocado", price: 1.75)
        ]
    ),
    Food(
        name: "BBQ Burger",
        description: "Tender grilled chicken breast with mayo \nand fresh vegetables",
        price: 11.99,
        imagePath: "assets/Burgers/bbqBurger.jpeg",
        category: FoodCategory.burger,
        availableAddons: [
          Addon(name: "Spicy Sauce", price: 0.75),
          Addon(name: "Mushrooms", price: 1.25),
          Addon(name: "Swiss Cheese", price: 1.50)
        ]
    ),
    Food(
        name: "BlueMoon Burger",
        description: "Plant-based patty with fresh greens \nand vegan mayo",
        price: 10.99,
        imagePath: "assets/Burgers/bluemoonburger.jpeg",
        category: FoodCategory.burger,
        availableAddons: [
          Addon(name: "Vegan Cheese", price: 1.75),
          Addon(name: "Grilled Onions", price: 1.00),
          Addon(name: "Pickles", price: 0.50)
        ]
    ),
    Food(
        name: "Classic Cheese Burger",
        description: "Two beef patties with double cheese \nand all the fixings",
        price: 16.99,
        imagePath: "assets/Burgers/CheeseBurger.jpeg",
        category: FoodCategory.burger,
        availableAddons: [
          Addon(name: "Extra Patty", price: 3.50),
          Addon(name: "BBQ Sauce", price: 0.75),
          Addon(name: "Jalapeños", price: 1.00)
        ]
    ),
    Food(
        name: "Veggie Burger",
        description: "Golden fried fish fillet with tartar \nsauce and lettuce",
        price: 13.49,
        imagePath: "assets/Burgers/Veggie.jpeg",
        category: FoodCategory.burger,
        availableAddons: [
          Addon(name: "Extra Tartar Sauce", price: 0.50),
          Addon(name: "Lemon Wedge", price: 0.25),
          Addon(name: "Coleslaw", price: 1.25)
        ]
    ),

    // SALADS
    Food(
        name: "Caesar Salad",
        description: "Crisp romaine lettuce with Caesar\n dressing, croutons, and parmesan",
        price: 9.99,
        imagePath: "assets/Salad/Caesar.jpeg",
        category: FoodCategory.salad,
        availableAddons: [
          Addon(name: "Grilled Chicken", price: 3.00),
          Addon(name: "Extra Parmesan", price: 1.50),
          Addon(name: "Anchovies", price: 2.00)
        ]
    ),
    Food(
        name: "Greek Salad",
        description: "Mixed greens with feta cheese, olives, \nand Mediterranean dressing",
        price: 10.49,
        imagePath: "assets/Salad/greekSalad.jpeg",
        category: FoodCategory.salad,
        availableAddons: [
          Addon(name: "Extra Feta", price: 2.00),
          Addon(name: "Grilled Shrimp", price: 4.00),
          Addon(name: "Pita Bread", price: 1.50)
        ]
    ),
    Food(
        name: "Quinoa Salad",
        description: "Mixed greens with bacon, chicken, \nblue cheese, and hard-boiled egg",
        price: 12.99,
        imagePath: "assets/Salad/Quinoa.jpeg",
        category: FoodCategory.salad,
        availableAddons: [
          Addon(name: "Extra Bacon", price: 2.50),
          Addon(name: "Avocado", price: 1.75),
          Addon(name: "Blue Cheese Crumbles", price: 1.50)
        ]
    ),
    Food(
        name: "Sesame Salad",
        description: "Fresh baby spinach with strawberries,\n nuts, and balsamic dressing",
        price: 8.99,
        imagePath: "assets/Salad/sesame.jpeg",
        category: FoodCategory.salad,
        availableAddons: [
          Addon(name: "Candied Walnuts", price: 2.25),
          Addon(name: "Goat Cheese", price: 2.00),
          Addon(name: "Grilled Salmon", price: 5.00)
        ]
    ),
    Food(
        name: "SouthEast Salad",
        description: "Quinoa with mixed vegetables, chickpeas,\n and lemon vinaigrette",
        price: 11.49,
        imagePath: "assets/Salad/southeast.jpeg",
        category: FoodCategory.salad,
        availableAddons: [
          Addon(name: "Grilled Tofu", price: 2.50),
          Addon(name: "Hemp Seeds", price: 1.75),
          Addon(name: "Sun-dried Tomatoes", price: 1.50)
        ]
    ),


    // SIDES
    Food(
        name: "Garlic Bread",
        description: "Golden crispy fries seasoned \nwith sea salt",
        price: 4.99,
        imagePath: "assets/Sides/GarlicBread.jpeg",
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Cheese Sauce", price: 1.50),
          Addon(name: "Bacon Bits", price: 1.75),
          Addon(name: "Truffle Oil", price: 2.00)
        ]
    ),
    Food(
        name: "Beer Battered Onion Rings",
        description: "Thick cut onions in crispy beer\n batter with ranch dip",
        price: 5.99,
        imagePath: "assets/Sides/onionRings.png",
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Spicy Mayo", price: 0.75),
          Addon(name: "Extra Ranch", price: 0.50),
          Addon(name: "BBQ Sauce", price: 0.50)
        ]
    ),
    Food(
        name: "Loaded Fries",
        description: "Breaded mozzarella cheese sticks\n with marinara sauce",
        price: 6.49,
        imagePath: "assets/Sides/LoadedFries.jpeg",
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Extra Marinara", price: 0.75),
          Addon(name: "Jalapeño Poppers", price: 2.00),
          Addon(name: "Garlic Aioli", price: 1.00)
        ]
    ),
    Food(
        name: "Sweet Potato Fries",
        description: "Crispy sweet potato fries with \ncinnamon sugar and maple dip",
        price: 5.49,
        imagePath: "assets/Sides/sweetPotato.jpeg",
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Marshmallow Dip", price: 1.25),
          Addon(name: "Pecans", price: 1.50),
          Addon(name: "Honey Drizzle", price: 1.00)
        ]
    ),
    Food(
        name: "Mac",
        description: "Spicy buffalo wings with celery \nsticks and blue cheese dip",
        price: 8.99,
        imagePath: "assets/Sides/Mac.png",
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Extra Hot Sauce", price: 0.50),
          Addon(name: "Ranch Dressing", price: 0.75),
          Addon(name: "Celery & Carrots", price: 1.00)
        ]
    ),


    // DESSERTS
    Food(
        name: "Pear Pie",
        description: "Decadent triple layer chocolate \ncake with chocolate ganache",
        price: 6.99,
        imagePath: "assets/Desserts/Pearpie.png",
        category: FoodCategory.dessert,
        availableAddons: [
          Addon(name: "Vanilla Ice Cream", price: 2.00),
          Addon(name: "Fresh Berries", price: 1.75),
          Addon(name: "Whipped Cream", price: 1.00)
        ]
    ),
    Food(
        name: "New York Cheesecake",
        description: "Creamy vanilla cheesecake with \ngraham cracker crust",
        price: 5.99,
        imagePath: "assets/Desserts/CheeseCake.jpeg",
        category: FoodCategory.dessert,
        availableAddons: [
          Addon(name: "Strawberry Topping", price: 1.50),
          Addon(name: "Caramel Sauce", price: 1.25),
          Addon(name: "Chocolate Chips", price: 1.00)
        ]
    ),
    Food(
        name: "Homestyle Apple Pie",
        description: "Traditional apple pie with \ncinnamon and flaky crust",
        price: 4.99,
        imagePath: "assets/Desserts/ApplePie.png",
        category: FoodCategory.dessert,
        availableAddons: [
          Addon(name: "À la Mode", price: 2.00),
          Addon(name: "Caramel Drizzle", price: 1.25),
          Addon(name: "Extra Cinnamon", price: 0.50)
        ]
    ),
    Food(
        name: "Chocolate Brownie",
        description: "Rich, gooey chocolate brownies\n with chocolate chips",
        price: 4.49,
        imagePath: "assets/Desserts/ChocolateBrownie.jpeg",
        category: FoodCategory.dessert,
        availableAddons: [
          Addon(name: "Nuts", price: 1.50),
          Addon(name: "Powdered Sugar", price: 0.75),
          Addon(name: "Chocolate Sauce", price: 1.25)
        ]
    ),
    Food(
        name: "Red Valvet",
        description: "Three scoops of vanilla ice cream\n with hot fudge and cherry",
        price: 5.49,
        imagePath: "assets/Desserts/RedValvet.png",
        category: FoodCategory.dessert,
        availableAddons: [
          Addon(name: "Extra Scoop", price: 2.00),
          Addon(name: "Sprinkles", price: 0.75),
          Addon(name: "Crushed Oreos", price: 1.50)
        ]
    ),


    // DRINKS
    Food(
        name: "Caramel Macchiato",
        description: "Refreshing cola served ice cold\n with lemon wedge",
        price: 2.99,
        imagePath: "assets/Drinks/CaramelMacchiato.png",
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Extra Large", price: 1.00),
          Addon(name: "Cherry Flavor", price: 0.50),
          Addon(name: "Extra Ice", price: 0.00)
        ]
    ),
    Food(
        name: "Iced tea",
        description: "Freshly squeezed orange juice \npacked with vitamin C",
        price: 3.99,
        imagePath: "assets/Drinks/IcedTea.png",
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Pulp Free", price: 0.50),
          Addon(name: "Extra Vitamin C", price: 1.00),
          Addon(name: "Ice Cubes", price: 0.00)
        ]
    ),
    Food(
        name: "Tropical Smoothie",
        description: "Blend of mango, pineapple, and\n coconut with yogurt",
        price: 5.49,
        imagePath: "assets/Drinks/Smoothie.png",
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Protein Powder", price: 2.00),
          Addon(name: "Coconut Flakes", price: 1.00),
          Addon(name: "Chia Seeds", price: 1.50)
        ]
    ),
    Food(
        name: "Mojito",
        description: "Rich, aromatic coffee made \nfrom premium beans",
        price: 2.49,
        imagePath: "assets/Drinks/Mojito.png",
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Extra Shot", price: 1.50),
          Addon(name: "Oat Milk", price: 0.75),
          Addon(name: "Vanilla Syrup", price: 0.50)
        ]
    ),


    // Food(
    //     name: "Chocolate Milkshake",
    //     description: "Thick and creamy chocolate milkshake topped with whipped cream",
    //     price: 4.99,
    //     imagePath: "assets/images/milkshake.png",
    //     category: FoodCategory.drinks,
    //     availableAddons: [
    //       Addon(name: "Extra Thick", price: 0.75),
    //       Addon(name: "Chocolate Chips", price: 1.00),
    //       Addon(name: "Cherry on Top", price: 0.50)
    //     ]
    // ),
  ];
List<CartItem> customerCart=[];

  List<Food> get menu => _foodMenu;
  List<CartItem> get cart=> customerCart;

  // add to cart
  void addToCart(Food food,List<Addon>selectedAddons){
    CartItem? cartItem =customerCart.firstWhereOrNull((item){
      bool isSameFood= item.food==food;

      bool isSameListOfAddons= ListEquality().equals(item.addons, selectedAddons);
      return isSameListOfAddons && isSameFood;
    });

    if(cartItem != null){
      cartItem.quantity++;
    }
    else {
      customerCart.add(CartItem(food: food, addons: selectedAddons));
    }
  notifyListeners();
  }
  // remove from cart
void removeFromCart(CartItem item){
    int itemIndex=customerCart.indexOf(item);

    if(itemIndex!=-1){
      if(customerCart[itemIndex].quantity>1){
        customerCart[itemIndex].quantity--;
      }else{
        customerCart.remove(item);
      }
    }
    notifyListeners();
}
  // get total price of cart
  double get totalCartPrice{
    double totalPrice=0;
    for(int i=0;i<customerCart.length;i++){
       totalPrice+=(customerCart[i].itemTotalPrice)*customerCart[i].quantity;
    }
    return totalPrice;
  }

  // get total items of cart
    int getItemCount() {
        int totalItems=0;

        for(CartItem item in customerCart){
          totalItems+=item.quantity;
        }
        return totalItems;
    }
  // clear cart
 void clearCart(){
    customerCart.clear();
    notifyListeners();
 }

  // generates a receipt

  // format double value to money

  //  format list of addons in string summary



}
