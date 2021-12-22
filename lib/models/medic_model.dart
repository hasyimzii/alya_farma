import 'dart:convert';

class MedicModel {
    MedicModel({
        required this.code,
        required this.name,
        required this.category,
        required this.unit,
        required this.stock,
        required this.price,
        required this.discount,
        required this.image,
        required this.description,
    });

    final String code;
    final String name;
    final String category;
    final String unit;
    final int stock;
    final int price;
    final int discount;
    final String image;
    final String description;

    factory MedicModel.fromJson(String str) => MedicModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MedicModel.fromMap(Map<String, dynamic> json) => MedicModel(
        code: json["code"],
        name: json["name"],
        category: json["category"],
        unit: json["unit"],
        stock: json["stock"],
        price: json["price"],
        discount: json["discount"],
        image: json["image"],
        description: json["description"],
    );

    Map<String, dynamic> toMap() => {
        "code": code,
        "name": name,
        "category": category,
        "unit": unit,
        "stock": stock,
        "price": price,
        "discount": discount,
        "image": image,
        "description": description,
    };
}
