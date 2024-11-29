
class PostResponse {
  final Post? result;
  final bool? ok;

  PostResponse({
    this.result,
    this.ok,
  });

  PostResponse copyWith({
    Post? result,
    bool? ok,
  }) =>
      PostResponse(
        result: result ?? this.result,
        ok: ok ?? this.ok,
      );

  factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
    result: json["result"] == null ? null : Post.fromJson(json["result"]),
    ok: json["ok"],
  );

  Map<String, dynamic> toJson() => {
    "result": result?.toJson(),
    "ok": ok,
  };
}

class Post {
  final int? id;
  final String? title;
  final int? category;
  final dynamic subCategory;
  final dynamic file;
  final String? fileType;
  final String? description;
  final bool? isPublished;
  final bool? isPremium;
  final String? image;

  Post({
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

  Post copyWith({
    int? id,
    String? title,
    int? category,
    dynamic subCategory,
    dynamic file,
    String? fileType,
    String? description,
    bool? isPublished,
    bool? isPremium,
    String? image,
  }) =>
      Post(
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

  factory Post.fromJson(Map<String, dynamic> json) => Post(
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
