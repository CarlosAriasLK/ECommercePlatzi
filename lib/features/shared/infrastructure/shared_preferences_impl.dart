


import 'package:ecommerce_platzi/features/shared/infrastructure/token_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesImpl implements TokenStorage {

  @override
  Future<String>? getToken() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token")!;
  }

  @override
  Future<void> removeToken() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
  }

  @override
  Future<void> saveToken(String token) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

}