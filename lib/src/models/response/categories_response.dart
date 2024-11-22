class CategoriesResponse {
  final List<Category>? result;
  final bool? ok;

  CategoriesResponse({
    this.result,
    this.ok,
  });

  CategoriesResponse copyWith({
    List<Category>? result,
    bool? ok,
  }) =>
      CategoriesResponse(
        result: result ?? this.result,
        ok: ok ?? this.ok,
      );

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => CategoriesResponse(
    result: json["result"] == null ? [] : List<Category>.from(json["result"]!.map((x) => Category.fromJson(x))),
    ok: json["ok"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    "ok": ok,
  };
}

class Category {
  final int? id;
  final String? name;
  final String? title;
  final List<dynamic>? subcategory;

  Category({
    this.id,
    this.name,
    this.title,
    this.subcategory,
  });

  Category copyWith({
    int? id,
    String? name,
    String? title,
    List<dynamic>? subcategory,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        title: title ?? this.title,
        subcategory: subcategory ?? this.subcategory,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    title: json["title"],
    subcategory: json["subcategory"] == null ? [] : List<dynamic>.from(json["subcategory"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "title": title,
    "subcategory": subcategory == null ? [] : List<dynamic>.from(subcategory!.map((x) => x)),
  };
}
