// To parse this JSON data, do
//
//     final jobDetailsEmployeeModel = jobDetailsEmployeeModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

JobDetailsEmployeeModel jobDetailsEmployeeModelFromJson(String str) =>
    JobDetailsEmployeeModel.fromJson(json.decode(str));

String jobDetailsEmployeeModelToJson(JobDetailsEmployeeModel data) =>
    json.encode(data.toJson());

class JobDetailsEmployeeModel {
  JobDetailsEmployeeModel({
    this.status,
    this.message,
    this.jobDetails,
  });

  bool status;
  String message;
  JobDetails jobDetails;

  factory JobDetailsEmployeeModel.fromJson(Map<String, dynamic> json) =>
      JobDetailsEmployeeModel(
        status: json["status"],
        message: json["message"],
        jobDetails: JobDetails.fromJson(json["jobDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "jobDetails": jobDetails.toJson(),
      };
}

class JobDetails {
  JobDetails({
    @required this.id,
    @required this.title,
    @required this.details,
    @required this.startFrom,
    @required this.meetingDate,
    @required this.meetingTime,
    @required this.meetingEnd,
    @required this.note,
    @required this.salary,
    @required this.gender,
    @required this.experience,
    @required this.qualification,
    @required this.interviewerName,
    @required this.interviewerRole,
    @required this.status,
    @required this.jobField,
    this.employer,
  });

  int id;
  String title;
  String details;
  dynamic startFrom;
  DateTime meetingDate;
  int meetingTime;
  dynamic meetingEnd;
  String note;
  int salary;
  int gender;
  int experience;
  String qualification;
  String interviewerName;
  String interviewerRole;
  String status;
  JobField jobField;
  Employer employer;

  factory JobDetails.fromJson(Map<String, dynamic> json) => JobDetails(
        id: json["id"],
        title: json["title"],
        details: json["details"],
        startFrom: json["start_from"],
        meetingDate: DateTime.parse(json["meeting_date"]),
        meetingTime: json["meeting_time"],
        meetingEnd: json["meeting_end"],
        note: json["note"],
        salary: json["salary"],
        gender: json["gender"],
        experience: json["experience"],
        qualification: json["qualification"],
        interviewerName: json["interviewer_name"],
        interviewerRole: json["interviewer_role"],
        status: json["status"],
        jobField: JobField.fromJson(json["job_field"]),
        employer: Employer.fromJson(json["employer"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "details": details,
        "start_from": startFrom,
        "meeting_date":
            "${meetingDate.year.toString().padLeft(4, '0')}-${meetingDate.month.toString().padLeft(2, '0')}-${meetingDate.day.toString().padLeft(2, '0')}",
        "meeting_time": meetingTime,
        "meeting_end": meetingEnd,
        "note": note,
        "salary": salary,
        "gender": gender,
        "experience": experience,
        "qualification": qualification,
        "interviewer_name": interviewerName,
        "interviewer_role": interviewerRole,
        "status": status,
        "job_field": jobField.toJson(),
        "employer": employer.toJson(),
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
    this.experience,
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
  int experience;

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
experience: json['experience'],
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
        'experience':experience
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

class JobField {
  JobField({
    this.categoryId,
    this.name,
    this.description,
  });

  int categoryId;
  String name;
  String description;

  factory JobField.fromJson(Map<String, dynamic> json) => JobField(
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
