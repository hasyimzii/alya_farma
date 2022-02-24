import 'package:dio/dio.dart';
import '../common/constant.dart';
import '../models/cart.dart';

class CartApi {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Constant.baseUrl,
    ),
  );

  static Future getCart({
    required String email,
  }) async {
    Response response = await _dio.get(
      '/cart',
      queryParameters: {
        'email': email,
      },
    );
    return Cart.fromJson(response.data);
  }
  
  static Future storeCart({
    required Map<String, dynamic> data,
  }) async {
    Response response = await _dio.post(
      '/cart/store',
      data: data,
    );
    return Cart.fromJson(response.data);
  }
}
