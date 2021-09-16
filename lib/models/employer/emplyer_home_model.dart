class HomeEmployerModel {
  bool status;
  String message;
  List<MyJob> myJob;
  List<AuthorJobs> authorJobs;

  HomeEmployerModel({this.status, this.message, this.myJob, this.authorJobs});

  HomeEmployerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['myJob'] != null) {
      myJob = [];
      json['myJob'].forEach((v) {
        myJob.add(new MyJob.fromJson(v));
      });
    }
    if (json['authorJobs'] != null) {
      authorJobs = [];
      json['authorJobs'].forEach((v) {
        authorJobs.add(new AuthorJobs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.myJob != null) {
      data['myJob'] = this.myJob.map((v) => v.toJson()).toList();
    }
    if (this.authorJobs != null) {
      data['authorJobs'] = this.authorJobs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyJob {
  int id;
  String title;
  String details;
  String startFrom;
  String meetingDate;
  int meetingTime;
  dynamic meetingEnd;
  dynamic note;
  int salary;
  int gender;
  int experience;
  dynamic qualification;
  dynamic interviewerName;
  dynamic interviewerRole;
  dynamic status;
  dynamic employeejobCount;
  dynamic applies;
  JobField jobField;
  Employer employer;

  MyJob(
      {this.id,
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
      this.employeejobCount,
      this.applies,
      this.jobField,
      this.employer});

  MyJob.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    details = json['details'];
    startFrom = json['start_from'];
    meetingDate = json['meeting_date'];
    meetingTime = json['meeting_time'];
    meetingEnd = json['meeting_end'];
    note = json['note'];
    salary = json['salary'];
    gender = json['gender'];
    experience = json['experience'];
    qualification = json['qualification'];
    interviewerName = json['interviewer_name'];
    interviewerRole = json['interviewer_role'];
    status = json['status'];
    employeejobCount = json['employeejob_count'];
    applies = json['applies'];
    jobField = json['job_field'] != null
        ? new JobField.fromJson(json['job_field'])
        : null;
    employer = json['employer'] != null
        ? new Employer.fromJson(json['employer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['details'] = this.details;
    data['start_from'] = this.startFrom;
    data['meeting_date'] = this.meetingDate;
    data['meeting_time'] = this.meetingTime;
    data['meeting_end'] = this.meetingEnd;
    data['note'] = this.note;
    data['salary'] = this.salary;
    data['gender'] = this.gender;
    data['experience'] = this.experience;
    data['qualification'] = this.qualification;
    data['interviewer_name'] = this.interviewerName;
    data['interviewer_role'] = this.interviewerRole;
    data['status'] = this.status;
    data['employeejob_count'] = this.employeejobCount;
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

class AuthorJobs {
  int id;
  String title;
  String details;
  String startFrom;
  String meetingDate;
  int meetingTime;
  String meetingEnd;
  String note;
  int salary;
  int gender;
  int experience;
  String qualification;
  String interviewerName;
  String interviewerRole;
  String status;
  dynamic employeejobCount;
  dynamic applies;
  JobField jobField;
  Employer employer;

  AuthorJobs(
      {this.id,
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
      this.employeejobCount,
      this.applies,
      this.jobField,
      this.employer});

  AuthorJobs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    details = json['details'];
    startFrom = json['start_from'];
    meetingDate = json['meeting_date'];
    meetingTime = json['meeting_time'];
    meetingEnd = json['meeting_end'];
    note = json['note'];
    salary = json['salary'];
    gender = json['gender'];
    experience = json['experience'];
    qualification = json['qualification'];
    interviewerName = json['interviewer_name'];
    interviewerRole = json['interviewer_role'];
    status = json['status'];
    employeejobCount = json['employeejob_count'];
    applies = json['applies'];
    jobField = json['job_field'] != null
        ? new JobField.fromJson(json['job_field'])
        : null;
    employer = json['employer'] != null
        ? new Employer.fromJson(json['employer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['details'] = this.details;
    data['start_from'] = this.startFrom;
    data['meeting_date'] = this.meetingDate;
    data['meeting_time'] = this.meetingTime;
    data['meeting_end'] = this.meetingEnd;
    data['note'] = this.note;
    data['salary'] = this.salary;
    data['gender'] = this.gender;
    data['experience'] = this.experience;
    data['qualification'] = this.qualification;
    data['interviewer_name'] = this.interviewerName;
    data['interviewer_role'] = this.interviewerRole;
    data['status'] = this.status;
    data['employeejob_count'] = this.employeejobCount;
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

class JobField {
  dynamic categoryId;
  String name;
  String description;

  JobField({this.categoryId, this.name, this.description});

  JobField.fromJson(Map<String, dynamic> json) {
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
  Business business;
  dynamic establishedAt;
  String website;
  Null active;
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
      this.business,
      this.establishedAt,
      this.website,
      this.active,
      this.image});

  Employer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    title = json['title'];
    email = json['email'];
    mobileNumber1 = json['mobile_number1'];
    mobileNumber2 = json['mobile_number2'];
    companyName = json['company_name'];
    country = json['country'];
    city = json['city'];
    business = json['business'] != null
        ? new Business.fromJson(json['business'])
        : null;
    establishedAt = json['established_at'];
    website = json['website'];
    active = json['active'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['title'] = this.title;
    data['email'] = this.email;
    data['mobile_number1'] = this.mobileNumber1;
    data['mobile_number2'] = this.mobileNumber2;
    data['company_name'] = this.companyName;
    data['country'] = this.country;
    data['city'] = this.city;
    if (this.business != null) {
      data['business'] = this.business.toJson();
    }
    data['established_at'] = this.establishedAt;
    data['website'] = this.website;
    data['active'] = this.active;
    data['image'] = this.image;
    return data;
  }
}

class Business {
  String name;
  String description;

  Business({this.name, this.description});

  Business.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
