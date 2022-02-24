import 'product.dart';
class Transaction {
    Transaction({
        required this.success,
        required this.data,
        required this.message,
    });

    final bool success;
    final List<TransactionData>? data;
    final String message;

    factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        success: json["success"],
        data: json["data"] == null ? null : List<TransactionData>.from(json["data"].map((x) => TransactionData.fromJson(x))),
        message: json["message"],
    );
}

class TransactionData {
    TransactionData({
        required this.date,
        required this.amount,
        required this.price,
        required this.product,
    });

    final String date;
    final String amount;
    final String price;
    final ProductData product;

    factory TransactionData.fromJson(Map<String, dynamic> json) => TransactionData(
        date: json["date"],
        amount: json["amount"],
        price: json["price"],
        product: ProductData.fromJson(json["product"]),
    );
}
