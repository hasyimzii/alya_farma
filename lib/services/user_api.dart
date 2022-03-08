import 'package:dio/dio.dart';
import '../utils/constant.dart';
import '../models/user.dart';

class UserApi {
  static Dio _dio(String token) => Dio(
        BaseOptions(
          baseUrl: Constant.baseUrl,
          headers: {'authorization': 'Bearer $token'},
        ),
      );

  static Future getUser({
    required String email,
    required String token,
  }) async {
    try {
      Response response = await _dio(token).get(
        'user/show',
        queryParameters: {
          'email': email,
        },
      );
      return User.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }

  static Future updateUser({
    required Map<String, dynamic> data,
    required String token,
  }) async {
    try {
      Response response = await _dio(token).post(
        'user/update',
        data: data,
      );
      return User.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }
}
