class Product {
    Product({
        required this.success,
        required this.data,
        required this.message,
    });

    final bool success;
    final List<ProductData>? data;
    final String message;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        success: json["success"],
        data: json["data"] == null ? null : List<ProductData>.from(json["data"].map((x) => ProductData.fromJson(x))),
        message: json["message"],
    );
}

class ProductData {
    ProductData({
        required this.code,
        required this.name,
        required this.category,
        required this.unit,
        required this.amount,
        required this.price,
        required this.discount,
        required this.image,
        required this.description,
    });

    final String code;
    final String name;
    final String category;
    final String unit;
    final String amount;
    final String price;
    final String discount;
    final String image;
    final String description;

    factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        code: json["code"],
        name: json["name"],
        category: json["category"],
        unit: json["unit"],
        amount: json["amount"],
        price: json["price"],
        discount: json["discount"],
        image: json["image"],
        description: json["description"],
    );
}
