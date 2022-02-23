class Category {
    Category({
        required this.success,
        required this.data,
        required this.message,
    });

    final bool success;
    final List<Datum> data;
    final String message;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
    );
}

class Datum {
    Datum({
        required this.name,
        required this.image,
    });

    final String name;
    final String image;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        image: json["image"],
    );
}
