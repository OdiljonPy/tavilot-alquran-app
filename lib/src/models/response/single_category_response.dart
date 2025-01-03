class SingleCategoryResponse {
  final List<SingleCategory>? result;
  final bool? ok;

  SingleCategoryResponse({
    this.result,
    this.ok,
  });

  SingleCategoryResponse copyWith({
    List<SingleCategory>? result,
    bool? ok,
  }) =>
      SingleCategoryResponse(
        result: result ?? this.result,
        ok: ok ?? this.ok,
      );

  factory SingleCategoryResponse.fromJson(Map<String, dynamic> json) => SingleCategoryResponse(
    result: json["result"] == null ? [] : List<SingleCategory>.from(json["result"]!.map((x) => SingleCategory.fromJson(x))),
    ok: json["ok"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    "ok": ok,
  };
}

class SingleCategory {
  final int? id;
  final String? title;
  final int? category;
  final dynamic subCategory;
  final String? file;
  final dynamic fileType;
  final String? description;
  final bool? isPublished;
  final bool? isPremium;
  final String? image;

  SingleCategory({
    this.id,
    this.title,
    this.category,
    this.subCategory,
    this.file,
    this.fileType,
    this.description,
    this.isPublished,
    this.isPremium,
    this.image,
  });

  SingleCategory copyWith({
    int? id,
    String? title,
    int? category,
    dynamic subCategory,
    String? file,
    dynamic fileType,
    String? description,
    bool? isPublished,
    bool? isPremium,
    String? image,
  }) =>
      SingleCategory(
        id: id ?? this.id,
        title: title ?? this.title,
        category: category ?? this.category,
        subCategory: subCategory ?? this.subCategory,
        file: file ?? this.file,
        fileType: fileType ?? this.fileType,
        description: description ?? this.description,
        isPublished: isPublished ?? this.isPublished,
        isPremium: isPremium ?? this.isPremium,
        image: image ?? this.image,
      );

  factory SingleCategory.fromJson(Map<String, dynamic> json) => SingleCategory(
    id: json["id"],
    title: json["title"],
    category: json["category"],
    subCategory: json["sub_category"],
    file: json["file"],
    fileType: json["file_type"],
    description: json["description"],
    isPublished: json["is_published"],
    isPremium: json["is_premium"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "category": category,
    "sub_category": subCategory,
    "file": file,
    "file_type": fileType,
    "description": description,
    "is_published": isPublished,
    "is_premium": isPremium,
    "image": image,
  };
}
