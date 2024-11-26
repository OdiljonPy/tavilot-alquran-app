class SignUpRequest {
  final String? phoneNumber;
  final String? password;

  SignUpRequest({
    required this.phoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["password"] = password;
    map["phone_number"] = phoneNumber;
    return map;
  }
}
