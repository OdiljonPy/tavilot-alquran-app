import 'get_categories_response.dart';

class GetSingleCategory {
  final GetCategory? result;
  final bool? ok;

  GetSingleCategory({
    this.result,
    this.ok,
  });

  GetSingleCategory copyWith({
    GetCategory? result,
    bool? ok,
  }) =>
      GetSingleCategory(
        result: result ?? this.result,
        ok: ok ?? this.ok,
      );

  factory GetSingleCategory.fromJson(Map<String, dynamic> json) => GetSingleCategory(
    result: json["result"] == null ? null : GetCategory.fromJson(json["result"]),
    ok: json["ok"],
  );

  Map<String, dynamic> toJson() => {
    "result": result?.toJson(),
    "ok": ok,
  };
}

