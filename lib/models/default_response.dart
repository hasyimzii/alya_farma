class DefaultResponse {
    DefaultResponse({
        required this.success,
        required this.data,
        required this.message,
    });

    final bool success;
    final dynamic data;
    final String message;

    factory DefaultResponse.fromJson(Map<String, dynamic> json) => DefaultResponse(
        success: json["success"],
        data: json["data"],
        message: json["message"],
    );
}
