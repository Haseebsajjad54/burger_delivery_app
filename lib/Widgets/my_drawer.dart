import 'package:burger_delivery_app/Screens/login_page.dart';
import 'package:burger_delivery_app/Screens/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../theme/theme_provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child:Provider.of<ThemeProvider>(context).isDarkMode ? Lottie.asset('assets/truck_animation_darkMode.json',):Lottie.asset('assets/truck_animation.json',),

              ),

              ListTile(
                leading: Icon(Icons.home,color: Theme.of(context).colorScheme.inversePrimary,),
                title: Text('H O M E',style: TextStyle(color:Theme.of(context).colorScheme.inversePrimary, ),),

              ),
              ListTile(
                leading: Icon(Icons.settings,color: Theme.of(context).colorScheme.inversePrimary,),
                title: Text('S E T T I N G S',style: TextStyle(color:Theme.of(context).colorScheme.inversePrimary, ),),
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage())),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListTile(
              leading: Icon(Icons.logout,color: Theme.of(context).colorScheme.inversePrimary,),
              title: Text('L O G O U T',style: TextStyle(color:Theme.of(context).colorScheme.inversePrimary, ),),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage())),

            ),
          ),
        ],
      ),
    );
  }
}

