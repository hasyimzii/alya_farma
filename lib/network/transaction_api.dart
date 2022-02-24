import 'package:dio/dio.dart';
import '../common/constant.dart';
import '../models/transaction.dart';

class TransactionApi {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Constant.baseUrl,
    ),
  );

  static Future getTransaction({
    required String email,
  }) async {
    Response response = await _dio.get(
      '/transaction',
      queryParameters: {
        'email': email,
      },
    );
    return Transaction.fromJson(response.data);
  }
  
  // static Future updateTransaction({
  //   required Map<String, dynamic> data,
  // }) async {
  //   Response response = await _dio.post(
  //     '/user/update',
  //     data: data,
  //   );
  //   return Transaction.fromJson(response.data);
  // }
}
