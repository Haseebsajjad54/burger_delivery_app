import 'package:burger_delivery_app/Screens/home_page.dart';
import 'package:burger_delivery_app/Screens/register_page.dart';
import 'package:burger_delivery_app/Widgets/custom_button.dart';
import 'package:burger_delivery_app/Widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../theme/theme_provider.dart';

class LoginPage extends StatefulWidget {
   const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   final TextEditingController emailController=TextEditingController();
   final TextEditingController passwordController=TextEditingController();
signUserIn(){
  showDialog(
      context: context,
      builder: (ctx)=>AlertDialog(
        content: Text('User Signed In successfully',style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.done))
        ],
      )
  );
  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>HomePage()));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Provider.of<ThemeProvider>(context).isDarkMode ? Lottie.asset('assets/truck_animation_darkMode.json',):Lottie.asset('assets/truck_animation.json',),
            Text('Food Delivery App',style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 18,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            CustomTextField(hintText: 'Email', obscureText: false,controller: emailController,),
            SizedBox(height: 10,),
            CustomTextField(hintText: 'Password', obscureText: true,controller: passwordController,),
            SizedBox(height: 10,),
            CustomButton(label: 'Sign In',onTap: signUserIn,),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?',
                style: TextStyle(color:Theme.of(context).colorScheme.primary)
                ),
                SizedBox(width: 4,),
                GestureDetector(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (ctx)=>RegisterPage())) ,
                  child: Text('Register here',
                    style: TextStyle(color: Colors.blue),),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
