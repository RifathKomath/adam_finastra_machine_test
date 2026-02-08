class UpdateProfileRequest {
    String name;
    String email;
    String dialCode;
    String phone;
    String gender;
    DateTime dateOfBirth;
    String profilePicture;

    UpdateProfileRequest({
        required this.name,
        required this.email,
        required this.dialCode,
        required this.phone,
        required this.gender,
        required this.dateOfBirth,
        required this.profilePicture,
    });

    factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) => UpdateProfileRequest(
        name: json["name"],
        email: json["email"],
        dialCode: json["dialCode"],
        phone: json["phone"],
        gender: json["gender"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        profilePicture: json["profilePicture"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "dialCode": dialCode,
        "phone": phone,
        "gender": gender,
        "dateOfBirth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "profilePicture": profilePicture,
    };
}
