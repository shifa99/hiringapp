class CandidatesAfterMeetingModel {
  bool status;
  String message;
  List<Employees> employees = [];

  CandidatesAfterMeetingModel({this.status, this.message, this.employees});

  CandidatesAfterMeetingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['employees'] != null) {
      json['employees'].forEach((v) {
        employees.add(new Employees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.employees != null) {
      data['employees'] = this.employees.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employees {
  int id;
  String fullName;
  String email;
  String country;
  String city;
  String title;
  String qualification;
  String university;
  int graduationYear;
  int experience;
  String studyField;
  int derivingLicence;
  String stage;
  List<String> skills;
  List<String> languages;
  String birth;
  int gender;
  Industry industry;
  dynamic cv;
  dynamic audio;
  dynamic video;
  String image;

  Employees(
      {this.id,
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
      this.stage,
      this.skills,
      this.languages,
      this.birth,
      this.gender,
      this.industry,
      this.cv,
      this.audio,
      this.video,
      this.image});

  Employees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    country = json['country'];
    city = json['city'];
    title = json['title'];
    qualification = json['qualification'];
    university = json['university'];
    graduationYear = json['graduation_year'];
    studyField = json['study_field'];
    derivingLicence = json['deriving_licence'];
    stage = json['stage'];
    skills = json['skills'].cast<String>();
    languages = json['languages'].cast<String>();
    birth = json['birth'];
    experience = json['experience'];
    gender = json['gender'];
    industry = json['industry'] != null
        ? new Industry.fromJson(json['industry'])
        : null;
    cv = json['cv'];
    audio = json['audio'];
    video = json['video'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['country'] = this.country;
    data['city'] = this.city;
    data['title'] = this.title;
    data['qualification'] = this.qualification;
    data['university'] = this.university;
    data['graduation_year'] = this.graduationYear;
    data['study_field'] = this.studyField;
    data['deriving_licence'] = this.derivingLicence;
    data['stage'] = this.stage;
    data['skills'] = this.skills;
    data['languages'] = this.languages;
    data['birth'] = this.birth;
    data['gender'] = this.gender;
    if (this.industry != null) {
      data['industry'] = this.industry.toJson();
    }
    data['cv'] = this.cv;
    data['audio'] = this.audio;
    data['video'] = this.video;
    data['image'] = this.image;
    return data;
  }
}

class Industry {
  int categoryId;
  String name;
  String description;

  Industry({this.categoryId, this.name, this.description});

  Industry.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
