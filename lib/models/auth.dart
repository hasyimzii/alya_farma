class Auth {
  Auth({
    required this.success,
    required this.data,
    required this.message,
  });

  final bool success;
  final AuthData? data;
  final String message;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        success: json["success"],
        data: json["data"] == null ? null : AuthData.fromJson(json["data"]),
        message: json["message"],
      );
}

class AuthData {
  AuthData({
    required this.email,
    required this.token,
  });

  final String email;
  final String token;

  factory AuthData.fromJson(Map<String, dynamic> json) => AuthData(
        email: json["email"],
        token: json["token"],
      );
}
