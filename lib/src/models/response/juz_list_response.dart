class JuzListResponse {
  final List<JuzListItem>? result;
  final bool? ok;

  JuzListResponse({
    this.result,
    this.ok,
  });

  JuzListResponse copyWith({
    List<JuzListItem>? result,
    bool? ok,
  }) =>
      JuzListResponse(
        result: result ?? this.result,
        ok: ok ?? this.ok,
      );

  factory JuzListResponse.fromJson(Map<String, dynamic> json) => JuzListResponse(
    result: json["result"] == null ? [] : List<JuzListItem>.from(json["result"]!.map((x) => JuzListItem.fromJson(x))),
    ok: json["ok"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    "ok": ok,
  };
}

class JuzListItem {
  final int? id;
  final int? number;
  final String? title;

  JuzListItem({
    this.id,
    this.number,
    this.title,
  });

  JuzListItem copyWith({
    int? id,
    int? number,
    String? title,
  }) =>
      JuzListItem(
        id: id ?? this.id,
        number: number ?? this.number,
        title: title ?? this.title,
      );

  factory JuzListItem.fromJson(Map<String, dynamic> json) => JuzListItem(
    id: json["id"],
    number: json["number"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "number": number,
    "title": title,
  };
}
