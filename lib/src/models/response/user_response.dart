class UserResponse {
  User? result;
  bool? ok;

  UserResponse({
    this.result,
    this.ok,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    result: json["result"] == null ? null : User.fromJson(json["result"]),
    ok: json["ok"],
  );

  Map<String, dynamic> toJson() => {
    "result": result?.toJson(),
    "ok": ok,
  };
}

class User {
  final int? id;
  final num? balance;
  final String? phoneNumber;
  final String? additionalPhoneNumber;
  final String? fullName;
  final String? birthDate;
  final String? passportSeria;
  final String? pinfl;
  final String? placeIssue;
  final String? placeResidence;
  final String? dateIssue;
  final String? profileImage;
  final String? profileQrImage;
  final String? profileQrImageBlack;

  User({
    this.id,
    this.balance,
    this.phoneNumber,
    this.additionalPhoneNumber,
    this.fullName,
    this.birthDate,
    this.passportSeria,
    this.pinfl,
    this.placeIssue,
    this.placeResidence,
    this.dateIssue,
    this.profileImage,
    this.profileQrImage,
    this.profileQrImageBlack,
  });

  User copyWith({
    int? id,
    num? balance,
    String? phoneNumber,
    String? additionalPhoneNumber,
    String? fullName,
    String? birthDate,
    String? passportSeria,
    String? pinfl,
    String? placeIssue,
    String? placeResidence,
    String? dateIssue,
    String? profileImage,
    String? profileQrImage,
    String? profileQrImageBlack,
  }) =>
      User(
        id: id ?? this.id,
        balance: balance ?? this.balance,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        additionalPhoneNumber: additionalPhoneNumber ?? this.additionalPhoneNumber,
        fullName: fullName ?? this.fullName,
        birthDate: birthDate ?? this.birthDate,
        passportSeria: passportSeria ?? this.passportSeria,
        pinfl: pinfl ?? this.pinfl,
        placeIssue: placeIssue ?? this.placeIssue,
        placeResidence: placeResidence ?? this.placeResidence,
        dateIssue: dateIssue ?? this.dateIssue,
        profileImage: profileImage ?? this.profileImage,
        profileQrImage: profileQrImage ?? this.profileQrImage,
        profileQrImageBlack: profileQrImageBlack ?? this.profileQrImageBlack,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    balance: json["balance"],
    phoneNumber: json["phone_number"],
    additionalPhoneNumber: json["additional_phone_number"],
    fullName: json["full_name"],
    birthDate: json["birth_date"],
    passportSeria: json["passport_seria"],
    pinfl: json["pinfl"],
    placeIssue: json["place_issue"],
    placeResidence: json["place_residence"],
    dateIssue: json["date_issue"],
    profileImage: json["profile_image"],
    profileQrImage: json["profile_qr_image"],
    profileQrImageBlack: json["profile_qr_image_black"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "balance": balance,
    "phone_number": phoneNumber,
    "additional_phone_number": additionalPhoneNumber,
    "full_name": fullName,
    "birth_date": birthDate,
    "passport_seria": passportSeria,
    "pinfl": pinfl,
    "place_issue": placeIssue,
    "place_residence": placeResidence,
    "date_issue": dateIssue,
    "profile_image": profileImage,
    "profile_qr_image": profileQrImage,
    "profile_qr_image_black": profileQrImageBlack,
  };
}
