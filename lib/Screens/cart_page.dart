import 'package:burger_delivery_app/Models/restuarant.dart';
import 'package:burger_delivery_app/Screens/payment_page.dart';
import 'package:burger_delivery_app/Widgets/cart_item_tile.dart';
import 'package:burger_delivery_app/Widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context,restaurant,child)=>
       Scaffold(
        appBar: AppBar(
          title: Text("My Cart",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold,fontSize: 24),),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              restaurant.clearCart();
            }, icon: Icon(CupertinoIcons.delete)),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: restaurant.cart.length,
                          itemBuilder: (context, index) => CartItemTile(item: restaurant.cart[index])
                      )
                  ),
                  CustomButton(
                      label: "Go to check out \$${restaurant.totalCartPrice.toStringAsFixed(2)}",
                      onTap: (){
                        if(restaurant.cart.isNotEmpty) {
                          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>PaymentPage()));
                        }
                        else{
                          showDialog(context: context, builder: (ctx)=>AlertDialog(
                            title: Text("Error!"),
                            content: Text("Please Add an item to the cart"),
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                            actions: [
                              IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.done,color: Theme.of(context).colorScheme.primary,))
                            ],
                          )
                          );
                        }
                      }
                  ),
                  SizedBox(height: 70,)
                ],
              ),
        ),
    );
  }
}
