import 'dart:convert';
import '../models/medic.dart';

class Transaction {
    Transaction({
        required this.amount,
        required this.price,
        required this.medic,
    });

    final int amount;
    final int price;
    final Medic medic;

    factory Transaction.fromJson(String str) => Transaction.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Transaction.fromMap(Map<String, dynamic> json) => Transaction(
        amount: json["amount"],
        price: json["price"],
        medic: Medic.fromMap(json["medic"]),
    );

    Map<String, dynamic> toMap() => {
        "amount": amount,
        "price": price,
        "medic": medic.toMap(),
    };
}
