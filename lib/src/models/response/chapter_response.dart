import 'juz_response.dart';

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
