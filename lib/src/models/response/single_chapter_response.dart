import 'juz_response.dart';

class SingleChapterResponse {
  final SingleChapter? result;
  final bool? ok;

  SingleChapterResponse({
    this.result,
    this.ok,
  });

  SingleChapterResponse copyWith({
    SingleChapter? result,
    bool? ok,
  }) =>
      SingleChapterResponse(
        result: result ?? this.result,
        ok: ok ?? this.ok,
      );

  factory SingleChapterResponse.fromJson(Map<String, dynamic> json) => SingleChapterResponse(
    result: json["result"] == null ? null : SingleChapter.fromJson(json["result"]),
    ok: json["ok"],
  );

  Map<String, dynamic> toJson() => {
    "result": result?.toJson(),
    "ok": ok,
  };
}

class SingleChapter {
  final int? id;
  final String? name;
  final String? nameArabic;
  final int? verseNumber;
  final int? typeChoice;
  final String? description;
  final List<Verse>? verses;

  SingleChapter({
    this.id,
    this.name,
    this.nameArabic,
    this.verseNumber,
    this.typeChoice,
    this.description,
    this.verses,
  });

  SingleChapter copyWith({
    int? id,
    String? name,
    String? nameArabic,
    int? verseNumber,
    int? typeChoice,
    String? description,
    List<Verse>? verses,
  }) =>
      SingleChapter(
        id: id ?? this.id,
        name: name ?? this.name,
        nameArabic: nameArabic ?? this.nameArabic,
        verseNumber: verseNumber ?? this.verseNumber,
        typeChoice: typeChoice ?? this.typeChoice,
        description: description ?? this.description,
        verses: verses ?? this.verses,
      );

  factory SingleChapter.fromJson(Map<String, dynamic> json) => SingleChapter(
    id: json["id"],
    name: json["name"],
    nameArabic: json["name_arabic"],
    verseNumber: json["verse_number"],
    typeChoice: json["type_choice"],
    description: json["description"],
    verses: json["verses"] == null ? [] : List<Verse>.from(json["verses"]!.map((x) => Verse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_arabic": nameArabic,
    "verse_number": verseNumber,
    "type_choice": typeChoice,
    "description": description,
    "verses": verses == null ? [] : List<dynamic>.from(verses!.map((x) => x.toJson())),
  };
}

