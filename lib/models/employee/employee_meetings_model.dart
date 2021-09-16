class EmployeeMeetingsModel {
  bool status;
  String message;
  List<ScheduleMeetings> notConfirmscheduledMeetings = [];
  List<ScheduleMeetings> confirmedscheduledMeetings = [];

  EmployeeMeetingsModel.fromJson(Map data,{String state='not_confirmed'}) 
  {
    this.status = data['status'];
    this.message = data['message'];
    data['not_confirmed'].forEach((element) {
      notConfirmscheduledMeetings.add(ScheduleMeetings.fromJson(element));
    });
      data['confirmed'].forEach((element) {
      confirmedscheduledMeetings.add(ScheduleMeetings.fromJson(element));
    });
  }
}

class ScheduleMeetings {
  int id;
  String jobId;
  String candatApplayStatus;
  dynamic meetingTimeStatus;
  String note;
  dynamic candatStatus;
  dynamic canduteStatus;
  String createdAt;
  AvailableMeeting availableMeeting;
  Employee employee;
  Job job;
  ScheduleMeetings.fromJson(Map data) {
    id = data['id'];
    jobId = data['job_id'];
    candatApplayStatus = data['candat_applay_status'];
    meetingTimeStatus = data['meeting_time_status'];
    note = data['note'];
    candatStatus = data['candat_status'];
    canduteStatus = data['candute_status'];
    createdAt = data['created_at'];
    availableMeeting = data['available_meeting'] != null
        ? AvailableMeeting.fromJson(data['available_meeting'])
        : null;
    employee =
        data['employee'] != null ? Employee.fromJson(data['employee']) : null;
    job = data['job'] != null ? Job.fromJson(data['job']) : null;
  }
}

class AvailableMeeting {
  int id;
  String jobId;
  String timeFrom;
  String timeTo;
  int time;
  String date;
  int available;

  AvailableMeeting(
      {this.id,
      this.jobId,
      this.timeFrom,
      this.timeTo,
      this.time,
      this.date,
      this.available});

  AvailableMeeting.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    jobId = data['job_id'];
    timeFrom = data['time_from'];
    timeTo = data['time_to'];
    time = data['time'];
    date = data['date'];
    available = data['available'];
  }
}

class Employee {
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

  Employee(
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

  Employee.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    fullName = data['fullName'];
    email = data['email'];
    country = data['country'];
    city = data['city'];
    title = data['title'];
    qualification = data['qualification'];
    university = data['university'];
    graduationYear = data['graduation_year'];
    experience = data['experience'];
    birth = data['birth'];
    age = data['age'];
    gender = data['gender'];
    studyField = data['study_field'];
    derivingLicence = data['deriving_licence'];
    skills = data['skills'].cast<String>();
    languages = data['languages'].cast<String>();
    industry =
        data['industry'] != null ? Industry.fromJson(data['industry']) : null;
    cv = data['cv'];
    audio = data['audio'];
    video = data['video'];
    image = data['image'];
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
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

class Job {
  int id;
  String title;
  String details;
  String startFrom;
  String meetingEnd;
  String meetingDate;
  int meetingTime;
  String note;
  int salary;
  int gender;
  int experience;
  String qualification;
  String interviewerName;
  String interviewerRole;
  String status;
  int employeeJobCount;
  int applies;
  Industry jobField;
  Employer employer;

  Job(
      {this.id,
      this.title,
      this.details,
      this.startFrom,
      this.meetingEnd,
      this.meetingDate,
      this.meetingTime,
      this.note,
      this.salary,
      this.gender,
      this.experience,
      this.qualification,
      this.interviewerName,
      this.interviewerRole,
      this.status,
      this.employeeJobCount,
      this.applies,
      this.jobField,
      this.employer});

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    details = json['details'];
    startFrom = json['start_from'];
    meetingEnd = json['meeting_end'];
    meetingDate = json['meeting_date'];
    meetingTime = json['meeting_time'];
    note = json['note'];
    salary = json['salary'];
    gender = json['gender'];
    experience = json['experience'];
    qualification = json['qualification'];
    interviewerName = json['interviewer_name'];
    interviewerRole = json['interviewer_role'];
    status = json['status'];
    employeeJobCount = json['EmployeeJob_count'];
    applies = json['applies'];
    jobField =
        json['job_field'] != null ? Industry.fromJson(json['job_field']) : null;
    employer =
        json['employer'] != null ? Employer.fromJson(json['employer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['details'] = this.details;
    data['start_from'] = this.startFrom;
    data['meeting_end'] = this.meetingEnd;
    data['meeting_date'] = this.meetingDate;
    data['meeting_time'] = this.meetingTime;
    data['note'] = this.note;
    data['salary'] = this.salary;
    data['gender'] = this.gender;
    data['experience'] = this.experience;
    data['qualification'] = this.qualification;
    data['interviewer_name'] = this.interviewerName;
    data['interviewer_role'] = this.interviewerRole;
    data['status'] = this.status;
    data['EmployeeJob_count'] = this.employeeJobCount;
    data['applies'] = this.applies;
    if (this.jobField != null) {
      data['job_field'] = this.jobField.toJson();
    }
    if (this.employer != null) {
      data['employer'] = this.employer.toJson();
    }
    return data;
  }
}

class Employer {
  int id;
  String fullName;
  String title;
  String email;
  String mobileNumber1;
  String mobileNumber2;
  String companyName;
  String country;
  String city;
  int establishedAt;
  String website;
  dynamic active;
  Business business;
  String image;

  Employer(
      {this.id,
      this.fullName,
      this.title,
      this.email,
      this.mobileNumber1,
      this.mobileNumber2,
      this.companyName,
      this.country,
      this.city,
      this.establishedAt,
      this.website,
      this.active,
      this.business,
      this.image});

  Employer.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    fullName = data['fullName'];
    title = data['title'];
    email = data['email'];
    mobileNumber1 = data['mobile_number1'];
    mobileNumber2 = data['mobile_number2'];
    companyName = data['company_name'];
    country = data['country'];
    city = data['city'];
    establishedAt = data['established_at'];
    website = data['website'];
    active = data['active'];
    business =
        data['business'] != null ? Business.fromJson(data['business']) : null;
    image = data['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'fullName': this.fullName,
      'title': this.title,
      'email': this.email,
      'mobile_number1': this.mobileNumber1,
      'mobile_number2': this.mobileNumber2,
      'company_name': this.companyName,
      'country': this.country,
      'city': this.city,
      'established_at': this.establishedAt,
      'website': this.website,
      'active': this.active,
      'business': this.business != null ? this.business.toJson() : null,
      'image': this.image
    };
  }
}

class Business {
  String name;
  String description;

  Business({this.name, this.description});

  Business.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    description = data['description'];
  }

  Map<String, dynamic> toJson() {
    return {'name': this.name, 'description': this.description};
  }
}
