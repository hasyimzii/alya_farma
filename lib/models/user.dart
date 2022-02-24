class User {
    User({
        required this.success,
        required this.data,
        required this.message,
    });

    final bool success;
    final UserData? data;
    final String message;

    factory User.fromJson(Map<String, dynamic> json) => User(
        success: json["success"],
        data: json["data"] == null ? null : UserData.fromJson(json["data"]),
        message: json["message"],
    );
}

class UserData {
    UserData({
        required this.name,
        required this.email,
        required this.phone,
        required this.token,
    });

    final String name;
    final String email;
    final String phone;
    final String token;

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        token: json["token"],
    );
}
