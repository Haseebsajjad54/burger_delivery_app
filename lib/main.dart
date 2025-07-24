import 'package:burger_delivery_app/Models/restuarant.dart';
import 'package:burger_delivery_app/Screens/login_page.dart';
import 'package:burger_delivery_app/theme/dark.dart';
import 'package:burger_delivery_app/theme/light.dart';
import 'package:burger_delivery_app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'Screens/home_page.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create:  (context)=>ThemeProvider(),
            ),
            ChangeNotifierProvider(
              create:  (context)=>Restaurant(),
            ),

          ],
              child: const MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:Provider.of<ThemeProvider>(context).theme,
      home: const LoginPage(),
    );
  }
}


