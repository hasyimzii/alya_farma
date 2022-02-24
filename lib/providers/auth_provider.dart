import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/crypt.dart';
import '../network/auth_api.dart';
import '../models/default_response.dart';

class AuthProvider with ChangeNotifier {
  late final SharedPreferences _preferences;
  String? _token;
  String? get token => _token;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    _token = _preferences.getString('token');
  }

  Future<DefaultResponse> regist({
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

    DefaultResponse response = await AuthApi.regist(data: data);
    return response;
  }

  Future<DefaultResponse> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': Crypt.encode(password),
    };

    DefaultResponse response = await AuthApi.login(data: data);

    if (response.success) {
      await _preferences.setString('token', response.data);
      notifyListeners();
    }
    return response;
  }

  Future<void> logout() async {
    _token = null;
    await _preferences.remove('token');
    notifyListeners();
  }
}
