class OtpRequest {
    String email;
    String otp;

    OtpRequest({
        required this.email,
        required this.otp,
    });

    factory OtpRequest.fromJson(Map<String, dynamic> json) => OtpRequest(
        email: json["email"],
        otp: json["otp"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "otp": otp,
    };
}
