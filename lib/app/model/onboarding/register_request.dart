class RegisterRequest {
    String name;
    String email;
    String password;
    String confirmPassword;
    String dialCode;
    String phone;
    String gender;
    DateTime dateOfBirth;
    String profilePicture;
    String profilePictureFile;

    RegisterRequest({
        required this.name,
        required this.email,
        required this.password,
        required this.confirmPassword,
        required this.dialCode,
        required this.phone,
        required this.gender,
        required this.dateOfBirth,
        required this.profilePicture,
        required this.profilePictureFile,
    });

    factory RegisterRequest.fromJson(Map<String, dynamic> json) => RegisterRequest(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
        dialCode: json["dialCode"],
        phone: json["phone"],
        gender: json["gender"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        profilePicture: json["profilePicture"],
        profilePictureFile: json["profilePictureFile"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "dialCode": dialCode,
        "phone": phone,
        "gender": gender,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "profilePicture": profilePicture,
        "profilePictureFile": profilePictureFile,
    };
}
