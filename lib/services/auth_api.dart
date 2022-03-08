import 'package:dio/dio.dart';
import '../utils/constant.dart';
import '../models/auth.dart';

class AuthApi {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Constant.baseUrl,
    ),
  );

  static Future regist({
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await _dio.post(
        'regist',
        data: data,
      );
      return Auth.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }

  static Future login({
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await _dio.post(
        'login',
        data: data,
      );
      return Auth.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }
}
