import 'package:dio/dio.dart';
import '../utils/constant.dart';
import '../models/cart.dart';

class CartApi {
  static Dio _dio(String token) => Dio(
        BaseOptions(
          baseUrl: Constant.baseUrl,
          headers: {'authorization': 'Bearer $token'},
        ),
      );

  static Future getCart({
    required String email,
    required String token,
  }) async {
    try {
      Response response = await _dio(token).get(
        'cart',
        queryParameters: {
          'email': email,
        },
      );
      return Cart.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future storeCart({
    required Map<String, dynamic> data,
    required String token,
  }) async {
    try {
      Response response = await _dio(token).post(
        'cart/store',
        data: data,
      );
      return Cart.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future addAmountCart({
    required Map<String, dynamic> data,
    required String token,
  }) async {
    try {
      await _dio(token).post(
        'cart/addAmount',
        data: data,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future subAmountCart({
    required Map<String, dynamic> data,
    required String token,
  }) async {
    try {
      await _dio(token).post(
        'cart/subAmount',
        data: data,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future deleteCart({
    required Map<String, dynamic> data,
    required String token,
  }) async {
    try {
      await _dio(token).post(
        'cart/delete',
        data: data,
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
