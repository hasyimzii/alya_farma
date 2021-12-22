// To parse this JSON data, do
//
//     final medicModel = medicModelFromMap(jsonString);

import 'dart:convert';

class MedicModel {
    MedicModel({
        required this.code,
        required this.name,
        required this.category,
        required this.unit,
        required this.buyPrice,
        required this.price,
        required this.discount,
        required this.stock,
        required this.image,
        required this.description,
    });

    final String code;
    final String name;
    final String category;
    final String unit;
    final int buyPrice;
    final int price;
    final int discount;
    final int stock;
    final String image;
    final String description;

    factory MedicModel.fromJson(String str) => MedicModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MedicModel.fromMap(Map<String, dynamic> json) => MedicModel(
        code: json["code"],
        name: json["name"],
        category: json["category"],
        unit: json["unit"],
        buyPrice: json["buy_price"],
        price: json["price"],
        discount: json["discount"],
        stock: json["stock"],
        image: json["image"],
        description: json["description"],
    );

    Map<String, dynamic> toMap() => {
        "code": code,
        "name": name,
        "category": category,
        "unit": unit,
        "buy_price": buyPrice,
        "price": price,
        "discount": discount,
        "stock": stock,
        "image": image,
        "description": description,
    };
}
