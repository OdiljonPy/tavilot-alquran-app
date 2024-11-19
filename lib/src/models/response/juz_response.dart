class JuzResponse {
  final Result? result;
  final bool? ok;

  JuzResponse({
    this.result,
    this.ok,
  });

  JuzResponse copyWith({
    Result? result,
    bool? ok,
  }) =>
      JuzResponse(
        result: result ?? this.result,
        ok: ok ?? this.ok,
      );

  factory JuzResponse.fromJson(Map<String, dynamic> json) => JuzResponse(
    result: json["result"] == null ? null : Result.fromJson(json["result"]),
    ok: json["ok"],
  );

  Map<String, dynamic> toJson() => {
    "result": result?.toJson(),
    "ok": ok,
  };
}

class Result {
  final int? id;
  final int? number;
  final String? title;
  final List<Chapter>? chapters;

  Result({
    this.id,
    this.number,
    this.title,
    this.chapters,
  });

  Result copyWith({
    int? id,
    int? number,
    String? title,
    List<Chapter>? chapters,
  }) =>
      Result(
        id: id ?? this.id,
        number: number ?? this.number,
        title: title ?? this.title,
        chapters: chapters ?? this.chapters,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    number: json["number"],
    title: json["title"],
    chapters: json["chapters"] == null ? [] : List<Chapter>.from(json["chapters"]!.map((x) => Chapter.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "number": number,
    "title": title,
    "chapters": chapters == null ? [] : List<dynamic>.from(chapters!.map((x) => x.toJson())),
  };
}

class Chapter {
  final int? id;
  final List<int>? juz;
  final String? name;
  final String? nameArabic;
  final int? verseNumber;
  final int? typeChoice;
  final String? description;
  final int? number;
  final List<Verse>? verses;

  Chapter({
    this.id,
    this.juz,
    this.name,
    this.nameArabic,
    this.verseNumber,
    this.typeChoice,
    this.description,
    this.number,
    this.verses,
  });

  Chapter copyWith({
    int? id,
    List<int>? juz,
    String? name,
    String? nameArabic,
    int? verseNumber,
    int? typeChoice,
    String? description,
    int? number,
    List<Verse>? verses,
  }) =>
      Chapter(
        id: id ?? this.id,
        juz: juz ?? this.juz,
        name: name ?? this.name,
        nameArabic: nameArabic ?? this.nameArabic,
        verseNumber: verseNumber ?? this.verseNumber,
        typeChoice: typeChoice ?? this.typeChoice,
        description: description ?? this.description,
        number: number ?? this.number,
        verses: verses ?? this.verses,
      );

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
    id: json["id"],
    juz: json["juz"] == null ? [] : List<int>.from(json["juz"]!.map((x) => x)),
    name: json["name"],
    nameArabic: json["name_arabic"],
    verseNumber: json["verse_number"],
    typeChoice: json["type_choice"],
    description: json["description"],
    number: json["number"],
    verses: json["verses"] == null ? [] : List<Verse>.from(json["verses"]!.map((x) => Verse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "juz": juz == null ? [] : List<dynamic>.from(juz!.map((x) => x)),
    "name": name,
    "name_arabic": nameArabic,
    "verse_number": verseNumber,
    "type_choice": typeChoice,
    "description": description,
    "number": number,
    "verses": verses == null ? [] : List<dynamic>.from(verses!.map((x) => x.toJson())),
  };
}

class Verse {
  final int? id;
  final int? juz;
  final int? chapter;
  final int? number;
  final String? text;
  final String? textArabic;
  final dynamic description;

  Verse({
    this.id,
    this.juz,
    this.chapter,
    this.number,
    this.text,
    this.textArabic,
    this.description,
  });

  Verse copyWith({
    int? id,
    int? juz,
    int? chapter,
    int? number,
    String? text,
    String? textArabic,
    dynamic description,
  }) =>
      Verse(
        id: id ?? this.id,
        juz: juz ?? this.juz,
        chapter: chapter ?? this.chapter,
        number: number ?? this.number,
        text: text ?? this.text,
        textArabic: textArabic ?? this.textArabic,
        description: description ?? this.description,
      );

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
    id: json["id"],
    juz: json["juz"],
    chapter: json["chapter"],
    number: json["number"],
    text: json["text"],
    textArabic: json["text_arabic"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "juz": juz,
    "chapter": chapter,
    "number": number,
    "text": text,
    "text_arabic": textArabic,
    "description": description,
  };
}
