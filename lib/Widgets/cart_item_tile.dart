import 'package:burger_delivery_app/Models/cart_item.dart';
import 'package:burger_delivery_app/Models/restuarant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({super.key, required this.item});
final CartItem item;
  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context,restaurant,child)=>Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(item.food.imagePath,height: 90,),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(item.food.name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text('\$${item.itemTotalPrice.toStringAsFixed(2)}',style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                    ],
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                   IconButton(onPressed: (){
                      restaurant.removeFromCart(item);
                    }, icon: item.quantity == 1?  Icon(Icons.delete,color:Theme.of(context).colorScheme.inversePrimary ,)
                       :Icon(Icons.remove,color:Theme.of(context).colorScheme.inversePrimary )),
                    SizedBox(width: 20,
                      child: Text(item.quantity.toString(),textAlign: TextAlign.center,),
                    ),
                    IconButton(onPressed: (){
                      restaurant.addToCart(item.food, item.addons);
                    }, icon: Icon(Icons.add,color:Theme.of(context).colorScheme.inversePrimary ))
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20,),
          SizedBox(
            height: item.addons.isEmpty? 0:60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: item.addons.map((addon)
              =>Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: FilterChip(
                    label: Row(
                      children: [
                        Text(addon.name),
                        Text('(\$${addon.price})')
                      ],
                    ),
                    shape: StadiumBorder(
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.primary
                        )
                    ),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,fontSize: 12),
                    labelPadding: EdgeInsets.all(8),
                    onSelected: (value){}
                ),
              )
              ).toList(),
            ),
          )
        ],
      ),
    ));
  }
}
