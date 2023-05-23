import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalStorage {
  Future<String> saveToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('token', token);
    return token;
  }

  Future<String> getToken() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token') ?? '';
    return token;
  }

  Future<bool> isTokenExists() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token') ?? '';
    return token.isNotEmpty;
  }

  Future<bool> removeToken() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.remove('token');
    return token;
  }
}
