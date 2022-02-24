import 'package:dio/dio.dart';
import '../common/constant.dart';
import '../models/user.dart';

class UserApi {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Constant.baseUrl,
    ),
  );

  static Future getUser({
    required String email,
  }) async {
    Response response = await _dio.get(
      '/user/show',
      queryParameters: {
        'email': email,
      },
    );
    return User.fromJson(response.data);
  }
  
  static Future updateUser({
    required Map<String, dynamic> data,
  }) async {
    Response response = await _dio.post(
      '/user/update',
      data: data,
    );
    return User.fromJson(response.data);
  }
}
