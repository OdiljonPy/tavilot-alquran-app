class GetCategoryResponse {
  final List<GetCategory>? result;
  final bool? ok;

  GetCategoryResponse({
    this.result,
    this.ok,
  });

  GetCategoryResponse copyWith({
    List<GetCategory>? result,
    bool? ok,
  }) =>
      GetCategoryResponse(
        result: result ?? this.result,
        ok: ok ?? this.ok,
      );

  factory GetCategoryResponse.fromJson(Map<String, dynamic> json) => GetCategoryResponse(
    result: json["result"] == null ? [] : List<GetCategory>.from(json["result"]!.map((x) => GetCategory.fromJson(x))),
    ok: json["ok"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    "ok": ok,
  };
}

class GetCategory {
  final int? id;
  final String? title;
  final String? file;
  final String? fileType;
  final String? description;
  final String? youtubeUrl;
  final bool? isPublished;

  GetCategory({
    this.id,
    this.title,
    this.file,
    this.fileType,
    this.description,
    this.youtubeUrl,
    this.isPublished,
  });

  GetCategory copyWith({
    int? id,
    String? title,
    String? file,
    String? fileType,
    String? description,
    String? youtubeUrl,
    bool? isPublished,
  }) =>
      GetCategory(
        id: id ?? this.id,
        title: title ?? this.title,
        file: file ?? this.file,
        fileType: fileType ?? this.fileType,
        description: description ?? this.description,
        youtubeUrl: youtubeUrl ?? this.youtubeUrl,
        isPublished: isPublished ?? this.isPublished,
      );

  factory GetCategory.fromJson(Map<String, dynamic> json) => GetCategory(
    id: json["id"],
    title: json["title"],
    file: json["file"],
    fileType: json["file_type"],
    description: json["description"],
    isPublished: json["is_published"],
    youtubeUrl: json["youtube_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "file": file,
    "file_type": fileType,
    "description": description,
    "is_published": isPublished,
    "youtube_url": youtubeUrl,
  };
}
