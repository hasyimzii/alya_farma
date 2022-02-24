class Auth {
    Auth({
        required this.success,
        required this.data,
        required this.message,
    });

    final bool success;
    final UserData? data;
    final String message;

    factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        success: json["success"],
        data: json["data"] == null ? null : UserData.fromJson(json["data"]),
        message: json["message"],
    );
}

class UserData {
    UserData({
        required this.email,
        required this.token,
    });

    final String email;
    final String token;

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        email: json["email"],
        token: json["token"],
    );
}
