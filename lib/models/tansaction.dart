import 'product.dart';

class Transaction {
    Transaction({
        required this.amount,
        required this.price,
        required this.product,
    });

    final int amount;
    final int price;
    final Product product;

    factory Transaction.fromMap(Map<String, dynamic> json) => Transaction(
        amount: json["amount"],
        price: json["price"],
        product: Product.fromJson(json["product"]),
    );
}
