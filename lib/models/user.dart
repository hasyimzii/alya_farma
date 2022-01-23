import 'dart:convert';

class User {
    User({
        required this.name,
        required this.email,
        required this.phone,
    });

    final String name;
    final String email;
    final String phone;

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "phone": phone,
    };
}
