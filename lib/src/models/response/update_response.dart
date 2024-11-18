import 'user_response.dart';

class UpdateResponse {
  final User? result;
  final bool? ok;

  UpdateResponse({
    this.result,
    this.ok,
  });

  UpdateResponse copyWith({
    User? result,
    bool? ok,
  }) =>
      UpdateResponse(
        result: result ?? this.result,
        ok: ok ?? this.ok,
      );

  factory UpdateResponse.fromJson(Map<String, dynamic> json) => UpdateResponse(
    result: json["result"] == null ? null : User.fromJson(json["result"]),
    ok: json["ok"],
  );

  Map<String, dynamic> toJson() => {
    "result": result?.toJson(),
    "ok": ok,
  };
}

