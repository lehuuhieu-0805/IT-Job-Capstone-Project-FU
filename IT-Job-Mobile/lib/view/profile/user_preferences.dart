import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/entity/user.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';

  DateTime dateTime = DateTime.now();

  static const myUser = User(
      name: 'Kaito Kid',
      imagePath:
          'https://znews-photo.zingcdn.me/w660/Uploaded/oplukaa/2020_08_13/Conan_thumb.jpg',
      gender: 1,
      dob: '01/01/2000',
      address: 'Quận 9, TP. Hồ Chí Minh',
      phone: '+84 99999999',
      email: 'sieutromkid@gmail.com');

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
