// To parse this JSON data, do
//
//     final candidatesModel = candidatesModelFromJson(jsonString);

import 'dart:convert';

CandidatesModel candidatesModelFromJson(String str) =>
    CandidatesModel.fromJson(json.decode(str));

String candidatesModelToJson(CandidatesModel data) =>
    json.encode(data.toJson());

class CandidatesModel {
  CandidatesModel({
    this.status,
    this.message,
    this.candidates,
  });

  bool status;
  String message;
  List<Candidate> candidates = [];

  CandidatesModel.fromJson(Map<String, dynamic> json) {
    json['candat'].forEach((candidate) {
      candidates.add(Candidate.fromJson(candidate));
    });
    status = json['status'];
    message = json['messaage'];
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "candat": List<Candidate>.from(
            candidates.map((candidate) => candidate.toJson())),
      };
}

class Candidate {
  Candidate({
    this.id,
    this.jobId,
    this.candatApplayStatus,
    this.meetingTimeStatus,
    this.note,
    this.candatStatus,
    this.canduteStatus,
    this.createdAt,
    this.availableMeeting,
    this.employee,
    this.job,
  });

  int id;
  String jobId;
  dynamic candatApplayStatus;
  dynamic meetingTimeStatus;
  dynamic note;
  dynamic candatStatus;
  dynamic canduteStatus;
  DateTime createdAt;
  dynamic availableMeeting;
  Employee employee;
  Job job;
  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      id: json["id"],
      jobId: json["job_id"],
      candatApplayStatus: json["candat_applay_status"],
      meetingTimeStatus: json["meeting_time_status"],
      note: json["note"],
      candatStatus: json["candat_status"],
      canduteStatus: json["candute_status"],
      createdAt: DateTime.parse(json["created_at"]),
      availableMeeting: json["available_meeting"],
      employee: Employee.fromJson(json["employee"]),
      job: Job.fromJson(json["job"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "job_id": jobId,
        "candat_applay_status": candatApplayStatus,
        "meeting_time_status": meetingTimeStatus,
        "note": note,
        "candat_status": candatStatus,
        "candute_status": canduteStatus,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
        "available_meeting": availableMeeting,
        "employee": employee.toJson(),
        "job": job.toJson(),
      };
}

class Employee {
  Employee({
    this.id,
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
    this.experience,
    this.age,
  });

  int id;
  String fullName;
  String email;
  String country;
  String city;
  String title;
  String qualification;
  String university;
  int graduationYear;
  String studyField;
  int derivingLicence;
  List<String> skills;
  List<String> languages;
  String birth;
  int gender;
  Industry industry;
  dynamic cv;
  dynamic audio;
  dynamic video;
  String image;
  int experience;
  int age;

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json["id"],
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
      experience: json['experience'],
      age:json['age'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
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
        'experience': experience,
         'age':age
      };
}

class Industry {
  Industry({
    this.categoryId,
    this.name,
    this.description,
  });

  int categoryId;
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

class Job {
  Job({
    this.id,
    this.title,
    this.details,
    this.startFrom,
    this.meetingDate,
    this.meetingTime,
    this.meetingEnd,
    this.note,
    this.salary,
    this.gender,
    this.experience,
    this.qualification,
    this.interviewerName,
    this.interviewerRole,
    this.status,
    this.jobField,
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
  Industry jobField;
  Employer employer;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
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
        jobField: Industry.fromJson(json["job_field"]),
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
    this.id,
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

  int id;
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

  factory Employer.fromJson(Map<String, dynamic> json) {
    return Employer(
      id: json["id"],
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
  }

  Map<String, dynamic> toJson() => {
        "id": id,
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
        "experience": experience,
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
