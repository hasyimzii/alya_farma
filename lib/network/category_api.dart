import 'package:dio/dio.dart';
import '../common/constant.dart';
import '../models/category.dart';

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
}