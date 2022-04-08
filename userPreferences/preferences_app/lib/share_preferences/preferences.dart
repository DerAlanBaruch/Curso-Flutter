import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _name = '';
  static bool _isDarkMode = false;
  static int _genre = 1;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set name(String name) {
    _name = name;
    _prefs.setString('name', name);
  }

  static bool get isDarkMode {
    return _prefs.getBool('darkMode') ?? _isDarkMode;
  }

  static set isDarkMode(bool isDarkMode) {
    _isDarkMode = isDarkMode;
    _prefs.setBool('darkMode', isDarkMode);
  }

  static int get genre {
    return _prefs.getInt('genre') ?? _genre;
  }

  static set genre(int genre) {
    _genre = genre;
    _prefs.setInt('genre', genre);
  }
}
