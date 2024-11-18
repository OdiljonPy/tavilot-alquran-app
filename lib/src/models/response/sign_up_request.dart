class SignUpRequest {
  final String? phoneNumber;
  final String? password;
  final String? deviceId;

  SignUpRequest({
    required this.phoneNumber,
    required this.password,
    required this.deviceId,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["device_id"] = deviceId;
    map["password"] = password;
    map["phone_number"] = phoneNumber;
    return map;
  }
}
