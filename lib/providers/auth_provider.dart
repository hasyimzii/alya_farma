import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/crypt.dart';
import '../network/auth_api.dart';
import '../models/auth.dart';

class AuthProvider with ChangeNotifier {
  late final SharedPreferences _preferences;
  String? _email;
  String? _token;

  String? get email => _email;
  String? get token => _token;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    _email = _preferences.getString('email');
    _token = _preferences.getString('token');
  }

  Future<Auth> regist({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'password': Crypt.encode(password),
      'phone': phone
    };

    Auth response = await AuthApi.regist(data: data);
    return response;
  }

  Future<Auth> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': Crypt.encode(password),
    };

    Auth response = await AuthApi.login(data: data);

    if (response.success) {
      await _preferences.setString('email', Crypt.decode(response.data!.email));
      await _preferences.setString('token', Crypt.decode(response.data!.token));
      notifyListeners();
    }
    return response;
  }

  Future<void> logout() async {
    _email = null;
    _token = null;
    await _preferences.remove('email');
    await _preferences.remove('token');
    notifyListeners();
  }
}
