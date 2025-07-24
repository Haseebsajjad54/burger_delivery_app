import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   const CustomTextField({super.key, required this.hintText,required this.obscureText, required this.controller});

  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiary

            )
          ),
          focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary
          )
      ),

        ),
        obscureText: obscureText,
      ),
    );
  }
}
