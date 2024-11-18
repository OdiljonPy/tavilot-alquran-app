import 'dart:convert';

RegisterResponse registerFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerToJson(RegisterResponse data) => json.encode(data.toJson());

class RegisterResponse {
  RegisterResponseModel? result;
  bool? ok;

  RegisterResponse({
    this.result,
    this.ok,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
    result: json["result"] == null ? null : RegisterResponseModel.fromJson(json["result"]),
    ok: json["ok"],
  );

  Map<String, dynamic> toJson() => {
    "result": result?.toJson(),
    "ok": ok,
  };
}

class RegisterResponseModel {
  String? otpKey;

  RegisterResponseModel({
    this.otpKey,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => RegisterResponseModel(
    otpKey: json["otp_key"],
  );

  Map<String, dynamic> toJson() => {
    "otp_key": otpKey,
  };
}
