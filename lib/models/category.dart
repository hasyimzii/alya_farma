class Category {
    Category({
        required this.success,
        required this.data,
        required this.message,
    });

    final bool success;
    final List<CategoryData> data;
    final String message;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        success: json["success"],
        data: List<CategoryData>.from(json["data"].map((x) => CategoryData.fromJson(x))),
        message: json["message"],
    );
}

class CategoryData {
    CategoryData({
        required this.name,
        required this.image,
    });

    final String name;
    final String image;

    factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        name: json["name"],
        image: json["image"],
    );
}
