class CompanyDetailsModel {
  bool status;
  String message;
  Employer employer;

  CompanyDetailsModel({this.status, this.message, this.employer});

  CompanyDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    employer = json['employer'] != null
        ?  Employer.fromJson(json['employer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
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
      {
      this.id,
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
      data['business'] = this.business.toMap();
    }
    data['image'] = this.image;
    return data;
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

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
