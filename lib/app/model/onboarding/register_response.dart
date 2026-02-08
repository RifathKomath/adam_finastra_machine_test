class RegisterResponse {
    bool? success;
    String? message;
    User? user;

    RegisterResponse({
        this.success,
        this.message,
        this.user,
    });

    factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
        success: json["success"],
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "user": user?.toJson(),
    };
}

class User {
    String? name;
    String? email;
    String? password;
    String? dialCode;
    String? phone;
    String? gender;
    DateTime? dateOfBirth;
    String? otp;
    DateTime? otpExpire;
    bool? isOtpVerified;
    bool? isBlocked;
    String? profilePicture;
    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? userId;
    int? v;

    User({
        this.name,
        this.email,
        this.password,
        this.dialCode,
        this.phone,
        this.gender,
        this.dateOfBirth,
        this.otp,
        this.otpExpire,
        this.isOtpVerified,
        this.isBlocked,
        this.profilePicture,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.userId,
        this.v,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        dialCode: json["dialCode"],
        phone: json["phone"],
        gender: json["gender"],
        dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
        otp: json["otp"],
        otpExpire: json["otpExpire"] == null ? null : DateTime.parse(json["otpExpire"]),
        isOtpVerified: json["isOtpVerified"],
        isBlocked: json["isBlocked"],
        profilePicture: json["profilePicture"],
        id: json["_id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        userId: json["id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "dialCode": dialCode,
        "phone": phone,
        "gender": gender,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
        "otp": otp,
        "otpExpire": otpExpire?.toIso8601String(),
        "isOtpVerified": isOtpVerified,
        "isBlocked": isBlocked,
        "profilePicture": profilePicture,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "id": userId,
        "__v": v,
    };
}
