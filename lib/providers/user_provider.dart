import 'package:flutter/foundation.dart';
import '../models/user.dart';
import '../services/user_api.dart';

class UserProvider with ChangeNotifier {
  Future<User> updateUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String token,
  }) async {
    Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };

    User response = await UserApi.updateUser(
      data: data,
      token: token,
    );
    return response;
  }
}
