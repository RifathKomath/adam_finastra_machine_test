class LoginResponse {
    bool? success;
    String? message;
    String? token;
    UserLoginedData? user;

    LoginResponse({
        this.success,
        this.message,
        this.token,
        this.user,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        message: json["message"],
        token: json["token"],
        user: json["user"] == null ? null : UserLoginedData.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "token": token,
        "user": user?.toJson(),
    };
}

class UserLoginedData {
    String? id;
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
    DateTime? createdAt;
    DateTime? updatedAt;
    String? userId;
    int? v;

    UserLoginedData({
        this.id,
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
        this.createdAt,
        this.updatedAt,
        this.userId,
        this.v,
    });

    factory UserLoginedData.fromJson(Map<String, dynamic> json) => UserLoginedData(
        id: json["_id"],
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
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        userId: json["id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
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
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "id": userId,
        "__v": v,
    };
}
