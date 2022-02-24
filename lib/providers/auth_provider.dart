import 'package:flutter/cupertino.dart';
import '../common/crypt.dart';
import '../network/auth_api.dart';
import '../models/default_response.dart';

class AuthProvider with ChangeNotifier {
  Future<DefaultResponse> regist({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    Map<String, dynamic> data = {
      'name': name,
      'email': Crypt.encode(email),
      'password': Crypt.encode(password),
      'phone': phone
    };

    DefaultResponse response = await AuthApi.regist(data: data);
    return response;
  }
}
