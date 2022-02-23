import 'package:dio/dio.dart';
import '../common/constant.dart';
import '../models/category.dart';
import '../models/product.dart';

class CategoryApi {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Constant.baseUrl,
    ),
  );

  static Future getCategory() async {
    try {
      Response response = await _dio.get('/category');
      return Category.fromJson(response.data);
    } on DioError catch (e) {
      return e.response;
    }
  }

  static Future searchCategory({
    required String category,
  }) async {
    try {
      Response response = await _dio.get('/category', queryParameters: {
        'category': category,
      });
      return Product.fromJson(response.data);
    } on DioError catch (e) {
      return e.response;
    }
  }
}
