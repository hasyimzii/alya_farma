import 'product.dart';

class Cart {
    Cart({
        required this.amount,
        required this.product,
    });

    final int amount;
    final ProductData product;

    factory Cart.fromMap(Map<String, dynamic> json) => Cart(
        amount: json["amount"],
        product: ProductData.fromJson(json["product"]),
    );
}