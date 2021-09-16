class AcceptedEmployeesForLiveJobModel {
  bool status;
  String message;
  List<AcceptedEmployees> acceptedEmployees=[];

  AcceptedEmployeesForLiveJobModel({this.status, this.message, this.acceptedEmployees});

  AcceptedEmployeesForLiveJobModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['accepted_employees'] != null) {
      json['accepted_employees'].forEach((v) {
        acceptedEmployees.add(new AcceptedEmployees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.acceptedEmployees != null) {
      data['accepted_employees'] =
          this.acceptedEmployees.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AcceptedEmployees {
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
  String birth;
  int age;
  int gender;
  String studyField;
  int derivingLicence;
  List<String> skills;
  List<String> languages;
  Industry industry;
  dynamic cv;
  dynamic audio;
  dynamic video;
  String image;

  AcceptedEmployees(
      {this.id,
      this.fullName,
      this.email,
      this.country,
      this.city,
      this.title,
      this.qualification,
      this.university,
      this.graduationYear,
      this.experience,
      this.birth,
      this.age,
      this.gender,
      this.studyField,
      this.derivingLicence,
      this.skills,
      this.languages,
      this.industry,
      this.cv,
      this.audio,
      this.video,
      this.image});

  AcceptedEmployees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    country = json['country'];
    city = json['city'];
    title = json['title'];
    qualification = json['qualification'];
    university = json['university'];
    graduationYear = json['graduation_year'];
    experience = json['experience'];
    birth = json['birth'];
    age = json['age'];
    gender = json['gender'];
    studyField = json['study_field'];
    derivingLicence = json['deriving_licence'];
    skills = json['skills'].cast<String>();
    languages = json['languages'].cast<String>();
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
    data['experience'] = this.experience;
    data['birth'] = this.birth;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['study_field'] = this.studyField;
    data['deriving_licence'] = this.derivingLicence;
    data['skills'] = this.skills;
    data['languages'] = this.languages;
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
