import 'package:burger_delivery_app/Models/food.dart';
import 'package:burger_delivery_app/Models/restuarant.dart';
import 'package:burger_delivery_app/Screens/food_page.dart';
import 'package:burger_delivery_app/Widgets/food_tile.dart';
import 'package:burger_delivery_app/Widgets/my_drawer.dart';
import 'package:burger_delivery_app/Widgets/my_location.dart';
import 'package:burger_delivery_app/Widgets/mysliver_appbar.dart';
import 'package:burger_delivery_app/Widgets/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/description_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;


List<Food> filterMenuByCategory(FoodCategory category,List<Food> fullMenu){
  return fullMenu.where((food)=> food.category==category).toList();
}


List<Widget> getFoodInThisCategory(List<Food> fullMenu){
  return FoodCategory.values.map((category){
    List<Food> categoryMenu=filterMenuByCategory(category, fullMenu);

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: categoryMenu.length,
      itemBuilder: (context,index)=>FoodTile(
          food: categoryMenu[index],
        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (ctx)=>FoodPage(food: categoryMenu[index]))),
      )

    );
  }
  ).toList();
}
  @override
  void initState() {
    super.initState();
    _tabController=TabController(length: FoodCategory.values.length, vsync: this);
  }
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MyDrawer(),
      body:NestedScrollView(
          headerSliverBuilder: (context,innerBoxIsScrolled)=>[
            MySliverAppbar(
              title: MyTabBar(tabController:_tabController),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //Divider
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Theme.of(context).colorScheme.secondary,
                  ),

                  //Current Location
                  MyLocation(),
                  //Description Box
                  DescriptionBox()
                ],
              ),
            ),
          ],
          body: Consumer<Restaurant>(
            builder: (context,restaurant,child)=> TabBarView(
              controller: _tabController,
                children: getFoodInThisCategory(restaurant.menu),
            ),
          )
      )
    );
  }
}
