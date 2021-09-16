// To parse this JSON data, do
//
//     final employerRegisterModel = employerRegisterModelFromJson(jsonString);

import 'dart:convert';

EmployerRegisterModel employerRegisterModelFromJson(String str) =>
    EmployerRegisterModel.fromJson(json.decode(str));

String employerRegisterModelToJson(EmployerRegisterModel data) =>
    json.encode(data.toJson());

class EmployerRegisterModel {
  EmployerRegisterModel({
    this.status,
    this.message,
    this.employer,
    this.token,
  });

  bool status;
  String message;
  Employer employer;
  String token;

  factory EmployerRegisterModel.fromJson(Map<String, dynamic> json) =>
      EmployerRegisterModel(
        status: json["status"],
        message: json["message"],
        employer: Employer.fromJson(json["employer"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "employer": employer.toJson(),
        "token": token,
      };
}

class Employer {
  Employer({
    this.fullName,
    this.title,
    this.email,
    this.mobileNumber1,
    this.mobileNumber2,
    this.companyName,
    this.country,
    this.city,
    this.business,
    this.establishedAt,
    this.website,
    this.active,
    this.image,
    this.id,
  });
  int id;
  String fullName;
  String title;
  String email;
  String mobileNumber1;
  dynamic mobileNumber2;
  String companyName;
  String country;
  String city;
  Business business;
  int establishedAt;
  String website;
  dynamic active;
  dynamic image;

  factory Employer.fromJson(Map<String, dynamic> json) => Employer(
      fullName: json["fullName"],
      title: json["title"],
      email: json["email"],
      mobileNumber1: json["mobile_number1"],
      mobileNumber2: json["mobile_number2"],
      companyName: json["company_name"],
      country: json["country"],
      city: json["city"],
      business: Business.fromJson(json["business"]),
      establishedAt: json["established_at"],
      website: json["website"],
      active: json["active"],
      image: json["image"],
      id: json['id']);

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "title": title,
        "email": email,
        "mobile_number1": mobileNumber1,
        "mobile_number2": mobileNumber2,
        "company_name": companyName,
        "country": country,
        "city": city,
        "business": business.toJson(),
        "established_at": establishedAt,
        "website": website,
        "active": active,
        "image": image,
        'id':id,
      };
}

class Business {
  Business({
    this.name,
    this.description,
  });

  String name;
  String description;

  factory Business.fromJson(Map<String, dynamic> json) => Business(
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
      };
}
