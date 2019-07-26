import 'package:shared_preferences/shared_preferences.dart';

class ForsightSharedPrefs {
  Future<void> saveAccessToken(String token) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('token', token);
  }

  Future<void> saveRegistrationId(String registrationId) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('registration', registrationId);
  }

  Future<String> getRegistrationId() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('registration')??null;
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();

    bool isLogged = (prefs.getString('token') != null) ? true : false;

    return isLogged;
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('token') ?? null;
  }

  Future<bool> clearToken() async {
  final prefs = await SharedPreferences.getInstance();


    return prefs.clear();    
  }
}
