import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, required this.onTap});
 final  void Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width:MediaQuery.of(context).size.width * 0.85,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Text(label,textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: Theme.of(context).colorScheme.inversePrimary),),
      ),
    );
  }
}
