class LoginResponse {
  Login? result;
  bool? ok;

  LoginResponse({
    this.result,
    this.ok,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    result: json["result"] == null ? null : Login.fromJson(json["result"]),
    ok: json["ok"],
  );

  Map<String, dynamic> toJson() => {
    "result": result?.toJson(),
    "ok": ok,
  };
}

class Login {
  String? accessToken;
  String? refreshToken;
  int? userRate;

  Login({
    this.accessToken,
    this.refreshToken,
    this.userRate,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    accessToken: json["access_token"],
    refreshToken: json["refresh_token"],
    userRate: json["user_rate"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "refresh_token": refreshToken,
    "user_rate": userRate,
  };
}
