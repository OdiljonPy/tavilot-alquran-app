class AboutResponse {
  final About? result;
  final bool? ok;

  AboutResponse({
    this.result,
    this.ok,
  });

  AboutResponse copyWith({
    About? result,
    bool? ok,
  }) =>
      AboutResponse(
        result: result ?? this.result,
        ok: ok ?? this.ok,
      );

  factory AboutResponse.fromJson(Map<String, dynamic> json) => AboutResponse(
    result: json["result"] == null ? null : About.fromJson(json["result"]),
    ok: json["ok"],
  );

  Map<String, dynamic> toJson() => {
    "result": result?.toJson(),
    "ok": ok,
  };
}

class About {
  final int? id;
  final String? description;

  About({
    this.id,
    this.description,
  });

  About copyWith({
    int? id,
    String? description,
  }) =>
      About(
        id: id ?? this.id,
        description: description ?? this.description,
      );

  factory About.fromJson(Map<String, dynamic> json) => About(
    id: json["id"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
  };
}
