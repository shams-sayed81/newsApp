import 'package:flutter/material.dart';

import '../core/prefs_helper.dart';


class ThemeProvider extends ChangeNotifier {

  ThemeMode currentTheme = ThemeMode.light;
  initTheme(){
    bool isDark =PrefsHelper.getTheme();
    if(isDark){
      currentTheme = ThemeMode.dark;
    }else{
      currentTheme = ThemeMode.light;
    }

  }
  void changeTheme (ThemeMode newTheme){
    currentTheme=newTheme;
    if(currentTheme==ThemeMode.light){
      PrefsHelper.setTheme(false);
    }else{
      PrefsHelper.setTheme(true);

    }

    notifyListeners();
  }
}