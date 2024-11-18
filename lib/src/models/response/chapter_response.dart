class ChapterResponse {
  final List<Chapter>? result;
  final bool? ok;

  ChapterResponse({
    this.result,
    this.ok,
  });

  ChapterResponse copyWith({
    List<Chapter>? result,
    bool? ok,
  }) =>
      ChapterResponse(
        result: result ?? this.result,
        ok: ok ?? this.ok,
      );

  factory ChapterResponse.fromJson(Map<String, dynamic> json) => ChapterResponse(
    result: json["result"] == null ? [] : List<Chapter>.from(json["result"]!.map((x) => Chapter.fromJson(x))),
    ok: json["ok"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    "ok": ok,
  };
}

class Chapter {
  final int? id;
  final String? name;
  final String? nameArabic;
  final int? verseNumber;
  final String? description;

  Chapter({
    this.id,
    this.name,
    this.nameArabic,
    this.verseNumber,
    this.description,
  });

  Chapter copyWith({
    int? id,
    String? name,
    String? nameArabic,
    int? verseNumber,
    String? description,
  }) =>
      Chapter(
        id: id ?? this.id,
        name: name ?? this.name,
        nameArabic: nameArabic ?? this.nameArabic,
        verseNumber: verseNumber ?? this.verseNumber,
        description: description ?? this.description,
      );

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
    id: json["id"],
    name: json["name"],
    nameArabic: json["name_arabic"],
    verseNumber: json["verse_number"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_arabic": nameArabic,
    "verse_number": verseNumber,
    "description": description,
  };
}
