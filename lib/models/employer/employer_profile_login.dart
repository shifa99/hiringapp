// To parse this JSON data, do
//
//     final employerProfileModel = employerProfileModelFromJson(jsonString);

import 'dart:convert';

EmployerProfileModel employerProfileModelFromJson(String str) => EmployerProfileModel.fromJson(json.decode(str));

String employerProfileModelToJson(EmployerProfileModel data) => json.encode(data.toJson());

class EmployerProfileModel {
  EmployerProfileModel({
    this.status,
    this.message,
    this.employee,
  });

  bool status;
  String message;
  Employee employee;

  factory EmployerProfileModel.fromJson(Map<String, dynamic> json) => EmployerProfileModel(
    status: json["status"],
    message: json["message"],
    employee: Employee.fromJson(json["employee"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "employee": employee.toJson(),
  };
}

class Employee {
  Employee({
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
  });

  String fullName;
  String title;
  String email;
  String mobileNumber1;
  String mobileNumber2;
  String companyName;
  String country;
  String city;
  Business business;
  int establishedAt;
  String website;
  dynamic active;
  String image;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
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
  );

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
