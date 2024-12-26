class SearchResponse {
  final List<SearchData>? result;
  final bool? ok;

  SearchResponse({
    this.result,
    this.ok,
  });

  SearchResponse copyWith({
    List<SearchData>? result,
    bool? ok,
  }) =>
      SearchResponse(
        result: result ?? this.result,
        ok: ok ?? this.ok,
      );

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
    result: json["result"] == null ? [] : List<SearchData>.from(json["result"]!.map((x) => SearchData.fromJson(x))),
    ok: json["ok"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    "ok": ok,
  };
}

class SearchData {
  final int? id;
  final int? number;
  final int? chapterId;
  final String? chapterName;
  final String? chapterNameArabic;

  SearchData({
    this.id,
    this.number,
    this.chapterId,
    this.chapterName,
    this.chapterNameArabic,
  });

  SearchData copyWith({
    int? id,
    int? number,
    int? chapterId,
    String? chapterName,
    String? chapterNameArabic,
  }) =>
      SearchData(
        id: id ?? this.id,
        number: number ?? this.number,
        chapterId: chapterId ?? this.chapterId,
        chapterName: chapterName ?? this.chapterName,
        chapterNameArabic: chapterNameArabic ?? this.chapterNameArabic,
      );

  factory SearchData.fromJson(Map<String, dynamic> json) => SearchData(
    id: json["id"],
    number: json["number"],
    chapterId: json["chapter_id"],
    chapterName: json["chapter_name"],
    chapterNameArabic: json["chapter_name_arabic"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "number": number,
    "chapter_id": chapterId,
    "chapter_name": chapterName,
    "chapter_name_arabic": chapterNameArabic,
  };
}
