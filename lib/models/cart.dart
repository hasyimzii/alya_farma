import 'product.dart';

class Cart {
    Cart({
        required this.amount,
        required this.product,
    });

    final int amount;
    final Product product;

    factory Cart.fromMap(Map<String, dynamic> json) => Cart(
        amount: json["amount"],
        product: Product.fromJson(json["product"]),
    );
}