class LoginModel {
  bool status;
  String message;
  Employer employer;
  String token;

  LoginModel({this.status, this.message, this.employer, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    employer = json['employer'] != null
        ? new Employer.fromJson(json['employer'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.employer != null) {
      data['employer'] = this.employer.toJson();
    }
    data['token'] = this.token;
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
  String active;
  String createdAt;
  String updatedAt;

  Employer(
      {this.id,
        this.fullName,
        this.title,
        this.email,
        this.mobileNumber1,
        this.mobileNumber2,
        this.active,
        this.createdAt,
        this.updatedAt});

  Employer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    title = json['title'];
    email = json['email'];
    mobileNumber1 = json['mobile_number1'];
    mobileNumber2 = json['mobile_number2'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['title'] = this.title;
    data['email'] = this.email;
    data['mobile_number1'] = this.mobileNumber1;
    data['mobile_number2'] = this.mobileNumber2;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
