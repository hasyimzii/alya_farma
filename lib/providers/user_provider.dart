import 'package:flutter/foundation.dart';
import '../common/crypt.dart';
import '../models/user.dart';
import '../network/user_api.dart';

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
      'email': Crypt.encode(email),
      'phone': phone,
      'password': Crypt.encode(password),
    };

    User response = await UserApi.updateUser(
      data: data,
      token: token,
    );
    return response;
  }
}
