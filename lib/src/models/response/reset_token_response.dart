class ResetTokenResponse {
  String? result;
  bool? ok;

  ResetTokenResponse({
    this.result,
    this.ok,
  });

  factory ResetTokenResponse.fromJson(Map<String, dynamic> json) => ResetTokenResponse(
    result: json["result"],
    ok: json["ok"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "ok": ok,
  };
}
