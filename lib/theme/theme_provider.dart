import 'package:burger_delivery_app/theme/dark.dart';
import 'package:flutter/material.dart';

import 'light.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData theme=light;

  bool get isDarkMode => theme==dark;

  void toggleTheme(){
    if(isDarkMode){
      theme=light;
      notifyListeners();
    }
    else{
      theme=dark;
      notifyListeners();
    }
  }


}