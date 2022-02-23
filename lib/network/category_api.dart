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
    Response response = await _dio.get('/category');
    return Category.fromMap(response.data);
  }
}