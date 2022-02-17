import 'dart:convert';
import '../models/medic.dart';

class Cart {
    Cart({
        required this.amount,
        required this.medic,
    });

    final int amount;
    final Medic medic;

    factory Cart.fromJson(String str) => Cart.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Cart.fromMap(Map<String, dynamic> json) => Cart(
        amount: json["amount"],
        medic: Medic.fromMap(json["medic"]),
    );

    Map<String, dynamic> toMap() => {
        "amount": amount,
        "medic": medic.toMap(),
    };
}