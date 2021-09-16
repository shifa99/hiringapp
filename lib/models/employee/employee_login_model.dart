// To parse this JSON data, do
//
//     final employeeLoginModel = employeeLoginModelFromJson(jsonString);

import 'dart:convert';

EmployeeLoginModel employeeLoginModelFromJson(String str) => EmployeeLoginModel.fromJson(json.decode(str));

String employeeLoginModelToJson(EmployeeLoginModel data) => json.encode(data.toJson());

class EmployeeLoginModel {
  EmployeeLoginModel({
    this.status,
    this.message,
    this.employee,
    this.token,
  });

  bool status;
  String message;
  Employee employee;
  String token;

  factory EmployeeLoginModel.fromJson(Map<String, dynamic> json) => EmployeeLoginModel(
    status: json["status"],
    message: json["message"],
    employee: Employee.fromJson(json["employee"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "employee": employee.toJson(),
    "token": token,
  };
}

class Employee {
  Employee({
    this.fullName,
    this.email,
    this.country,
    this.city,
    this.title,
    this.qualification,
    this.university,
    this.graduationYear,
    this.studyField,
    this.derivingLicence,
    this.skills,
    this.languages,
    this.birth,
    this.gender,
    this.industry,
    this.cv,
    this.audio,
    this.video,
    this.image,
  });

  String fullName;
  String email;
  String country;
  String city;
  String title;
  String qualification;
  String university;
  String graduationYear;
  String studyField;
  String derivingLicence;
  List<String> skills;
  List<String> languages;
  String birth;
  String gender;
  Industry industry;
  dynamic cv;
  dynamic audio;
  dynamic video;
  String image;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    fullName: json["fullName"],
    email: json["email"],
    country: json["country"],
    city: json["city"],
    title: json["title"],
    qualification: json["qualification"],
    university: json["university"],
    graduationYear: json["graduation_year"],
    studyField: json["study_field"],
    derivingLicence: json["deriving_licence"],
    skills: List<String>.from(json["skills"].map((x) => x)),
    languages: List<String>.from(json["languages"].map((x) => x)),
    birth: json["birth"],
    gender: json["gender"],
    industry: Industry.fromJson(json["industry"]),
    cv: json["cv"],
    audio: json["audio"],
    video: json["video"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "email": email,
    "country": country,
    "city": city,
    "title": title,
    "qualification": qualification,
    "university": university,
    "graduation_year": graduationYear,
    "study_field": studyField,
    "deriving_licence": derivingLicence,
    "skills": List<dynamic>.from(skills.map((x) => x)),
    "languages": List<dynamic>.from(languages.map((x) => x)),
    "birth": birth,
    "gender": gender,
    "industry": industry.toJson(),
    "cv": cv,
    "audio": audio,
    "video": video,
    "image": image,
  };
}

class Industry {
  Industry({
    this.categoryId,
    this.name,
    this.description,
  });

  String categoryId;
  String name;
  String description;

  factory Industry.fromJson(Map<String, dynamic> json) => Industry(
    categoryId: json["category_id"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "name": name,
    "description": description,
  };
}
