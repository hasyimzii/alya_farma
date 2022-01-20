import 'dart:convert';

class Transaction {
    Transaction({
        required this.price,
        required this.amount,
        required this.medic,
    });

    final int price;
    final int amount;
    final List<Medic> medic;

    factory Transaction.fromJson(String str) => Transaction.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Transaction.fromMap(Map<String, dynamic> json) => Transaction(
        price: json["price"],
        amount: json["amount"],
        medic: List<Medic>.from(json["medic"].map((x) => Medic.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "price": price,
        "amount": amount,
        "medic": List<dynamic>.from(medic.map((x) => x.toMap())),
    };
}

class Medic {
    Medic({
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

    factory Medic.fromJson(String str) => Medic.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Medic.fromMap(Map<String, dynamic> json) => Medic(
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
