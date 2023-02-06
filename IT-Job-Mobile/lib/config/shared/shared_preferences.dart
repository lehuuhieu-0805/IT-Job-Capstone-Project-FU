import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/label.dart';

class AppPreference {
  Future<bool> setToken(String token) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(Label.token, token);
  }

  Future<String> getToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(Label.token) ?? '';
  }
}
