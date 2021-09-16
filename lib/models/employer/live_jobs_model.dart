class LiveJobsModel {
  bool status;
  String message;
  List<Jobs> jobs=[];

  LiveJobsModel({this.status, this.message, this.jobs});

  LiveJobsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['jobs'] != null) {
      json['jobs'].forEach((v) {
        jobs.add( Jobs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.jobs != null) {
      data['jobs'] = this.jobs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Jobs {
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
  int employeejobCount;
  int applies;
  JobField jobField;
  Employer employer;

  Jobs(
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
      this.employeejobCount,
      this.applies,
      this.jobField,
      this.employer});

  Jobs.fromJson(Map<String, dynamic> json) {
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
  int categoryId;
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
  int establishedAt;
  String website;
  Null active;
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
    establishedAt = json['established_at'];
    website = json['website'];
    active = json['active'];
    business = json['business'] != null
        ? new Business.fromJson(json['business'])
        : null;
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
    data['established_at'] = this.establishedAt;
    data['website'] = this.website;
    data['active'] = this.active;
    if (this.business != null) {
      data['business'] = this.business.toJson();
    }
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
