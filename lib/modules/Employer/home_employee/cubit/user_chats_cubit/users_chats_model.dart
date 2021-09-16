import 'package:hiring_app/components/constants.dart';

class UserChatsModel {
  bool status;
  String message;
  List<Employees> employees=[];

  UserChatsModel({this.status, this.message, this.employees});

  UserChatsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json[tokenEmployer != null && tokenEmployer != ''?'employees':'employers'] != null) {
      json[tokenEmployer != null && tokenEmployer != ''?'employees':'employers'].forEach((v) {
        employees.add(new Employees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.employees != null) {
      data[tokenEmployer != null && tokenEmployer != ''?'employees':'employers'] = this.employees.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employees {
  int id;
  String fullName;
  String image;

  Employees({this.id, this.fullName, this.image});

  Employees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['image'] = this.image;
    return data;
  }
}
