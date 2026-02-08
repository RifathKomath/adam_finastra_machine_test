class HomeDataResponse {
    bool? success;
    Data? data;

    HomeDataResponse({
        this.success,
        this.data,
    });

    factory HomeDataResponse.fromJson(Map<String, dynamic> json) => HomeDataResponse(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
    };
}

class Data {
    List<Category>? categories;
    List<Session>? sessions;
    List<PopularCourse>? popularCourses;
    List<TutorElement>? tutors;
    List<dynamic>? onGoingCorses;

    Data({
        this.categories,
        this.sessions,
        this.popularCourses,
        this.tutors,
        this.onGoingCorses,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
        sessions: json["sessions"] == null ? [] : List<Session>.from(json["sessions"]!.map((x) => Session.fromJson(x))),
        popularCourses: json["popularCourses"] == null ? [] : List<PopularCourse>.from(json["popularCourses"]!.map((x) => PopularCourse.fromJson(x))),
        tutors: json["tutors"] == null ? [] : List<TutorElement>.from(json["tutors"]!.map((x) => TutorElement.fromJson(x))),
        onGoingCorses: json["onGoingCorses"] == null ? [] : List<dynamic>.from(json["onGoingCorses"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "sessions": sessions == null ? [] : List<dynamic>.from(sessions!.map((x) => x.toJson())),
        "popularCourses": popularCourses == null ? [] : List<dynamic>.from(popularCourses!.map((x) => x.toJson())),
        "tutors": tutors == null ? [] : List<dynamic>.from(tutors!.map((x) => x.toJson())),
        "onGoingCorses": onGoingCorses == null ? [] : List<dynamic>.from(onGoingCorses!.map((x) => x)),
    };
}

class Category {
    String? id;
    String? name;
    String? description;
    bool? isActive;
    List<Subcategory>? subcategories;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    int? courseCount;
    bool? isSub;

    Category({
        this.id,
        this.name,
        this.description,
        this.isActive,
        this.subcategories,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.courseCount,
        this.isSub,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        isActive: json["isActive"],
        subcategories: json["subcategories"] == null ? [] : List<Subcategory>.from(json["subcategories"]!.map((x) => Subcategory.fromJson(x))),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        courseCount: json["courseCount"],
        isSub: json["isSub"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "isActive": isActive,
        "subcategories": subcategories == null ? [] : List<dynamic>.from(subcategories!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "courseCount": courseCount,
        "isSub": isSub,
    };
}

class Subcategory {
    String? name;
    String? description;
    String? image;
    bool? isActive;
    String? id;
    DateTime? createdAt;

    Subcategory({
        this.name,
        this.description,
        this.image,
        this.isActive,
        this.id,
        this.createdAt,
    });

    factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        name: json["name"],
        description: json["description"],
        image: json["image"],
        isActive: json["isActive"],
        id: json["_id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "image": image,
        "isActive": isActive,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
    };
}

class PopularCourse {
    String? id;
    PopularCourseTutor? tutor;
    String? courseName;
    String? courseImage;
    int? price;
    int? offerPrice;
    List<Lesson>? lessons;
    int? rating;
    String? company;
    String? companyName;
    int? reviewCount;
    String? courseDuration;

    PopularCourse({
        this.id,
        this.tutor,
        this.courseName,
        this.courseImage,
        this.price,
        this.offerPrice,
        this.lessons,
        this.rating,
        this.company,
        this.companyName,
        this.reviewCount,
        this.courseDuration,
    });

    factory PopularCourse.fromJson(Map<String, dynamic> json) => PopularCourse(
        id: json["_id"],
        tutor: json["tutor"] == null ? null : PopularCourseTutor.fromJson(json["tutor"]),
        courseName: json["courseName"],
        courseImage: json["courseImage"],
        price: json["price"],
        offerPrice: json["offerPrice"],
        lessons: json["lessons"] == null ? [] : List<Lesson>.from(json["lessons"]!.map((x) => Lesson.fromJson(x))),
        rating: json["rating"],
        company: json["company"],
        companyName: json["companyName"],
        reviewCount: json["reviewCount"],
        courseDuration: json["courseDuration"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "tutor": tutor?.toJson(),
        "courseName": courseName,
        "courseImage": courseImage,
        "price": price,
        "offerPrice": offerPrice,
        "lessons": lessons == null ? [] : List<dynamic>.from(lessons!.map((x) => x.toJson())),
        "rating": rating,
        "company": company,
        "companyName": companyName,
        "reviewCount": reviewCount,
        "courseDuration": courseDuration,
    };
}

class Lesson {
    String? lessonName;
    String? videoType;
    String? videoUrl;
    int? duration;
    String? unit;
    String? thumbnail;
    String? id;

    Lesson({
        this.lessonName,
        this.videoType,
        this.videoUrl,
        this.duration,
        this.unit,
        this.thumbnail,
        this.id,
    });

    factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        lessonName: json["lessonName"],
        videoType: json["videoType"],
        videoUrl: json["videoUrl"],
        duration: json["duration"],
        unit: json["unit"],
        thumbnail: json["thumbnail"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "lessonName": lessonName,
        "videoType": videoType,
        "videoUrl": videoUrl,
        "duration": duration,
        "unit": unit,
        "thumbnail": thumbnail,
        "_id": id,
    };
}

class PopularCourseTutor {
    String? id;
    String? name;
    String? profilePicture;

    PopularCourseTutor({
        this.id,
        this.name,
        this.profilePicture,
    });

    factory PopularCourseTutor.fromJson(Map<String, dynamic> json) => PopularCourseTutor(
        id: json["_id"],
        name: json["name"],
        profilePicture: json["profilePicture"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "profilePicture": profilePicture,
    };
}

class Session {
    String? id;
    PopularCourseTutor? tutor;
    String? topic;
    DateTime? scheduledDate;
    int? timezoneOffsetMinutes;
    bool? isNormalSession;
    bool? isImmediate;
    String? roomId;
    dynamic sessionId;
    dynamic meetingToken;
    String? meetingUrl;
    bool? isTutorJoined;
    bool? isLive;
    bool? isEnded;
    bool? isCanceled;
    DateTime? startTime;
    dynamic endTime;
    int? durationMinutes;
    dynamic recordingUrl;
    bool? isRecorded;
    List<dynamic>? recordings;
    List<dynamic>? attendees;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Session({
        this.id,
        this.tutor,
        this.topic,
        this.scheduledDate,
        this.timezoneOffsetMinutes,
        this.isNormalSession,
        this.isImmediate,
        this.roomId,
        this.sessionId,
        this.meetingToken,
        this.meetingUrl,
        this.isTutorJoined,
        this.isLive,
        this.isEnded,
        this.isCanceled,
        this.startTime,
        this.endTime,
        this.durationMinutes,
        this.recordingUrl,
        this.isRecorded,
        this.recordings,
        this.attendees,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Session.fromJson(Map<String, dynamic> json) => Session(
        id: json["_id"],
        tutor: json["tutor"] == null ? null : PopularCourseTutor.fromJson(json["tutor"]),
        topic: json["topic"],
        scheduledDate: json["scheduledDate"] == null ? null : DateTime.parse(json["scheduledDate"]),
        timezoneOffsetMinutes: json["timezoneOffsetMinutes"],
        isNormalSession: json["isNormalSession"],
        isImmediate: json["isImmediate"],
        roomId: json["roomId"],
        sessionId: json["sessionId"],
        meetingToken: json["meetingToken"],
        meetingUrl: json["meetingURL"],
        isTutorJoined: json["isTutorJoined"],
        isLive: json["isLive"],
        isEnded: json["isEnded"],
        isCanceled: json["isCanceled"],
        startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
        endTime: json["endTime"],
        durationMinutes: json["durationMinutes"],
        recordingUrl: json["recordingUrl"],
        isRecorded: json["isRecorded"],
        recordings: json["recordings"] == null ? [] : List<dynamic>.from(json["recordings"]!.map((x) => x)),
        attendees: json["attendees"] == null ? [] : List<dynamic>.from(json["attendees"]!.map((x) => x)),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "tutor": tutor?.toJson(),
        "topic": topic,
        "scheduledDate": scheduledDate?.toIso8601String(),
        "timezoneOffsetMinutes": timezoneOffsetMinutes,
        "isNormalSession": isNormalSession,
        "isImmediate": isImmediate,
        "roomId": roomId,
        "sessionId": sessionId,
        "meetingToken": meetingToken,
        "meetingURL": meetingUrl,
        "isTutorJoined": isTutorJoined,
        "isLive": isLive,
        "isEnded": isEnded,
        "isCanceled": isCanceled,
        "startTime": startTime?.toIso8601String(),
        "endTime": endTime,
        "durationMinutes": durationMinutes,
        "recordingUrl": recordingUrl,
        "isRecorded": isRecorded,
        "recordings": recordings == null ? [] : List<dynamic>.from(recordings!.map((x) => x)),
        "attendees": attendees == null ? [] : List<dynamic>.from(attendees!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class TutorElement {
    String? id;
    String? name;
    String? email;
    String? password;
    String? dialCode;
    String? phone;
    String? gender;
    DateTime? dateOfBirth;
    String? specialization;
    String? otp;
    DateTime? otpExpire;
    bool? isOtpVerified;
    bool? isBlocked;
    String? bio;
    List<Experience>? experience;
    List<BankDetail>? bankDetails;
    String? profilePicture;
    bool? isAdminVerified;
    bool? isAdminRejected;
    String? rejectReason;
    int? commission;
    String? company;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    int? courseCount;
    int? studentCount;

    TutorElement({
        this.id,
        this.name,
        this.email,
        this.password,
        this.dialCode,
        this.phone,
        this.gender,
        this.dateOfBirth,
        this.specialization,
        this.otp,
        this.otpExpire,
        this.isOtpVerified,
        this.isBlocked,
        this.bio,
        this.experience,
        this.bankDetails,
        this.profilePicture,
        this.isAdminVerified,
        this.isAdminRejected,
        this.rejectReason,
        this.commission,
        this.company,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.courseCount,
        this.studentCount,
    });

    factory TutorElement.fromJson(Map<String, dynamic> json) => TutorElement(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        dialCode: json["dialCode"],
        phone: json["phone"],
        gender: json["gender"],
        dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
        specialization: json["specialization"],
        otp: json["otp"],
        otpExpire: json["otpExpire"] == null ? null : DateTime.parse(json["otpExpire"]),
        isOtpVerified: json["isOtpVerified"],
        isBlocked: json["isBlocked"],
        bio: json["bio"],
        experience: json["experience"] == null ? [] : List<Experience>.from(json["experience"]!.map((x) => Experience.fromJson(x))),
        bankDetails: json["bankDetails"] == null ? [] : List<BankDetail>.from(json["bankDetails"]!.map((x) => BankDetail.fromJson(x))),
        profilePicture: json["profilePicture"],
        isAdminVerified: json["isAdminVerified"],
        isAdminRejected: json["isAdminRejected"],
        rejectReason: json["rejectReason"],
        commission: json["commission"],
        company: json["company"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        courseCount: json["courseCount"],
        studentCount: json["studentCount"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "dialCode": dialCode,
        "phone": phone,
        "gender": gender,
        "dateOfBirth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "specialization": specialization,
        "otp": otp,
        "otpExpire": otpExpire?.toIso8601String(),
        "isOtpVerified": isOtpVerified,
        "isBlocked": isBlocked,
        "bio": bio,
        "experience": experience == null ? [] : List<dynamic>.from(experience!.map((x) => x.toJson())),
        "bankDetails": bankDetails == null ? [] : List<dynamic>.from(bankDetails!.map((x) => x.toJson())),
        "profilePicture": profilePicture,
        "isAdminVerified": isAdminVerified,
        "isAdminRejected": isAdminRejected,
        "rejectReason": rejectReason,
        "commission": commission,
        "company": company,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "courseCount": courseCount,
        "studentCount": studentCount,
    };
}

class BankDetail {
    String? accountHolderName;
    String? accountNumber;
    String? bankName;
    String? ifscCode;
    bool? isPrimary;
    String? id;

    BankDetail({
        this.accountHolderName,
        this.accountNumber,
        this.bankName,
        this.ifscCode,
        this.isPrimary,
        this.id,
    });

    factory BankDetail.fromJson(Map<String, dynamic> json) => BankDetail(
        accountHolderName: json["accountHolderName"],
        accountNumber: json["accountNumber"],
        bankName: json["bankName"],
        ifscCode: json["ifscCode"],
        isPrimary: json["isPrimary"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "accountHolderName": accountHolderName,
        "accountNumber": accountNumber,
        "bankName": bankName,
        "ifscCode": ifscCode,
        "isPrimary": isPrimary,
        "_id": id,
    };
}

class Experience {
    String? experienceCertificate;
    String? role;
    String? companyName;
    int? startYear;
    int? endYear;
    String? id;

    Experience({
        this.experienceCertificate,
        this.role,
        this.companyName,
        this.startYear,
        this.endYear,
        this.id,
    });

    factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        experienceCertificate: json["experienceCertificate"],
        role: json["role"],
        companyName: json["companyName"],
        startYear: json["startYear"],
        endYear: json["endYear"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "experienceCertificate": experienceCertificate,
        "role": role,
        "companyName": companyName,
        "startYear": startYear,
        "endYear": endYear,
        "_id": id,
    };
}
