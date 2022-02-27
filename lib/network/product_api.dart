import 'package:dio/dio.dart';
import '../common/constant.dart';
import '../models/product.dart';

class ProductApi {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Constant.baseUrl,
    ),
  );

  static Future getProduct() async {
    try {
      Response response = await _dio.get('product');
      return Product.fromJson(response.data);
    } on DioError catch (e) {
      return e.response;
    }
  }

  static Future searchProduct({
    required String name,
  }) async {
    try {
      Response response = await _dio.get(
        'product/search',
        queryParameters: {
          'name': name,
        },
      );
      return Product.fromJson(response.data);
    } on DioError catch (e) {
      return e.response;
    }
  }
}
