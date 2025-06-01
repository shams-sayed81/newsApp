
import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {


  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static setTheme(bool value) {
    prefs.setBool('theme', value);
  }

  static bool getTheme() {
    return prefs.getBool('theme') ?? false;
  }
}