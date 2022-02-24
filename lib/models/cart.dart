import 'product.dart';
class Cart {
    Cart({
        required this.success,
        required this.data,
        required this.message,
    });

    final bool success;
    final List<CartData>? data;
    final String message;

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        success: json["success"],
        data: json["data"] == null ? null : List<CartData>.from(json["data"].map((x) => CartData.fromJson(x))),
        message: json["message"],
    );
}

class CartData {
    CartData({
        required this.cartId,
        required this.amount,
        required this.product,
    });

    final String cartId;
    final String amount;
    final ProductData product;

    factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        cartId: json["cart_id"],
        amount: json["amount"],
        product: ProductData.fromJson(json["product"]),
    );
}
