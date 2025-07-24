import 'package:burger_delivery_app/Models/restuarant.dart';
import 'package:burger_delivery_app/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/food.dart';

class FoodPage extends StatefulWidget {

 final Food food;
 final Map<Addon,bool> selectedAddons={};
 FoodPage({super.key, required this.food}){
      for(Addon addon in food.availableAddons){
        selectedAddons[addon]=false;
      }
 }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {


  void addItemToCart(Food food,Map<Addon,bool> selectedAddons){
  List<Addon>orderedAddons=[];
      // restaurant.addToCart(widget.food,widget.selectedAddons);
    for(Addon addon in widget.food.availableAddons){
      if(selectedAddons[addon]==true){
            orderedAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, orderedAddons);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                Image.asset(widget.food.imagePath),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
        
                children: [
        
                  Text(
                      widget.food.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                      '\$ ${widget.food.price}',
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                      widget.food.description,
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.inversePrimary
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Divider(color: Theme.of(context).colorScheme.secondary,),
                  Text(
                   "Addons",
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.inversePrimary
                    ),
                  ),
        
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary
                      ),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.food.availableAddons.length,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context,index){
                        Addon addon=widget.food.availableAddons[index];
                        return CheckboxListTile(
                            title: Text(addon.name),
                            subtitle:Text('\$ ${addon.price}') ,
                            value: widget.selectedAddons[addon],
                            onChanged: (value){
                              setState(() {
                                widget.selectedAddons[addon]=value!;
                              });
                            }
                        );
                        }
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0,bottom: 25),
              child: Consumer<Restaurant>(
                  builder: (context,restaurant,child)=>CustomButton(
                    label: "Add to Cart",
                    onTap:(){
                      showDialog(context: context, builder: (ctx)=>AlertDialog(
                        content: Text("Item added to Cart Successfully"),
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        actions: [
                          IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.done,
                                color: Theme.of(context).colorScheme.primary,
                              )
                          )
                        ],
                      )
                      );
                      addItemToCart(widget.food, widget.selectedAddons);
                      },
                  ),
              )
            ),
        
          ],
        ),
      ),
    );
  }
}
