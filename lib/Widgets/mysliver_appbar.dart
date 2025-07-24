import 'package:burger_delivery_app/Screens/cart_page.dart';
import 'package:flutter/material.dart';

class MySliverAppbar extends StatelessWidget {
  const MySliverAppbar({super.key, required this.child, required this.title});
final Widget child;
final Widget title;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 320,
      pinned: true,
      floating: false,
      actions: [
        IconButton(
            onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (ctx)=>CartPage())),
            icon: Icon(Icons.shopping_cart)
        )
      ],
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Text("Sunset Diner",textAlign: TextAlign.center,style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,),),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: child,
        title: title,
        centerTitle: true,
        titlePadding: EdgeInsets.only(left: 0,right: 0,top: 0),
        expandedTitleScale: 1,
      ),

    );
  }
}
