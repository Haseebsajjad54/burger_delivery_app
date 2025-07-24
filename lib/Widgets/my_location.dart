import 'package:burger_delivery_app/Widgets/custom_button.dart';
import 'package:burger_delivery_app/Widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class MyLocation extends StatelessWidget {
   MyLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver Now",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
          Row(
            children: [
              Text(locationController.text),
              IconButton(onPressed: ()=>openLocationBox(context), icon: Icon(Icons.keyboard_arrow_down_outlined))
            ],
          )
        ],
      ),
    );
  }
 final TextEditingController locationController=TextEditingController(text: "Your Location");

   openLocationBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context)=>AlertDialog(
            title: Text(
              "Enter your Location",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          content: CustomTextField(
              hintText: 'Location',
              obscureText: false,
              controller: locationController
          ),
          actions: [
              TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("Cancel")
              ),
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("save")
            )
          ],
        )
    );
   }
}
