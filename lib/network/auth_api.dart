import 'package:dio/dio.dart';
import '../common/constant.dart';
import '../models/default_response.dart';

class AuthApi {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Constant.baseUrl,
    ),
  );

  static Future regist({
    required Map<String, dynamic> data,
  }) async {
    Response response = await _dio.post(
      '/regist',
      data: data,
    );
    return DefaultResponse.fromJson(response.data);
  }
}
