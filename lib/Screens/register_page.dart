import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../Widgets/custom_button.dart';
import '../Widgets/custom_textfield.dart';
import '../theme/theme_provider.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
   RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController=TextEditingController();

  final TextEditingController passwordController=TextEditingController();

  final TextEditingController confirmPasswordController=TextEditingController();

  void signUserUp(){
  showDialog(
      context: context,
      builder: (ctx)=>AlertDialog(
        content: Text('User Created successfully'),
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.done))
        ],
      )
  );
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

            SizedBox(height: 50,),
            Text('Lets create an account for you....',style: TextStyle(color: Theme.of(context).colorScheme.primary),),
            SizedBox(height: 20,),
            CustomTextField(hintText: 'Email', obscureText: false,controller: emailController,),
            SizedBox(height: 10,),
            CustomTextField(hintText: 'Password', obscureText: true,controller: passwordController,),
            SizedBox(height: 10,),
            CustomTextField(hintText: 'Confirm password', obscureText: true,controller: confirmPasswordController,),
            CustomButton(label: 'Sign Up',onTap: signUserUp,

            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?',
                    style: TextStyle(color: Theme.of(context).colorScheme.primary)
                ),
                SizedBox(width: 4,),
                GestureDetector(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (ctx)=>LoginPage())) ,
                  child: Text('Log In',
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
