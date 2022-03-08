import 'package:dio/dio.dart';
import '../utils/constant.dart';
import '../models/transaction.dart';

class TransactionApi {
  static Dio _dio(String token) => Dio(
        BaseOptions(
          baseUrl: Constant.baseUrl,
          headers: {'authorization': 'Bearer $token'},
        ),
      );

  static Future getTransaction({
    required String email,
    required String token,
  }) async {
    try {
      Response response = await _dio(token).get(
        'transaction',
        queryParameters: {
          'email': email,
        },
      );
      return Transaction.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }

  static Future storeTransaction({
    required Map<String, dynamic> data,
    required String token,
  }) async {
    try {
      Response response = await _dio(token).post(
        'transaction/store',
        data: data,
      );
      return Transaction.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }
}
