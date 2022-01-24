import 'dart:convert';
import '../models/medic.dart';

class Cart {
    Cart({
        required this.amount,
        required this.check,
        required this.medic,
    });

    final int amount;
    final bool check;
    final Medic medic;

    factory Cart.fromJson(String str) => Cart.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Cart.fromMap(Map<String, dynamic> json) => Cart(
        amount: json["amount"],
        check: json["check"],
        medic: Medic.fromMap(json["medic"]),
    );

    Map<String, dynamic> toMap() => {
        "amount": amount,
        "check": check,
        "medic": medic.toMap(),
    };
}