class ChapterNames {
  final List<NameChapter>? result;
  final bool? ok;

  ChapterNames({
    this.result,
    this.ok,
  });

  ChapterNames copyWith({
    List<NameChapter>? result,
    bool? ok,
  }) =>
      ChapterNames(
        result: result ?? this.result,
        ok: ok ?? this.ok,
      );

  factory ChapterNames.fromJson(Map<String, dynamic> json) => ChapterNames(
    result: json["result"] == null ? [] : List<NameChapter>.from(json["result"]!.map((x) => NameChapter.fromJson(x))),
    ok: json["ok"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    "ok": ok,
  };
}

class NameChapter {
  final int? id;
  final String? name;

  NameChapter({
    this.id,
    this.name,
  });

  NameChapter copyWith({
    int? id,
    String? name,
  }) =>
      NameChapter(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory NameChapter.fromJson(Map<String, dynamic> json) => NameChapter(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
