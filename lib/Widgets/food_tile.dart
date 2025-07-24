import 'package:flutter/material.dart';

import '../Models/food.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({super.key, required this.food, required this.onTap});
final Food food;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(food.name),
                Text('\$${food.price}'),
                const SizedBox(height: 10,),
                Text(food.description),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
                child: Image.asset(food.imagePath,height: 120,)
            )
          ],
        ),
      ),
    );
  }
}
