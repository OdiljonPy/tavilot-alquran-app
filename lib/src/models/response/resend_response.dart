class ReSendResponse {
  ReSend? result;
  bool? ok;

  ReSendResponse({
    this.result,
    this.ok,
  });

  factory ReSendResponse.fromJson(Map<String, dynamic> json) => ReSendResponse(
    result: json["result"] == null ? null : ReSend.fromJson(json["result"]),
    ok: json["ok"],
  );

  Map<String, dynamic> toJson() => {
    "result": result?.toJson(),
    "ok": ok,
  };
}

class ReSend {
  String? otpKey;

  ReSend({
    this.otpKey,
  });

  factory ReSend.fromJson(Map<String, dynamic> json) => ReSend(
    otpKey: json["otp_key"],
  );

  Map<String, dynamic> toJson() => {
    "otp_key": otpKey,
  };
}
