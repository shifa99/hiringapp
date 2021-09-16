class EmployeeNotificationModel {
  bool status;
  String message;
  List<Notifications> notifications=[];

  EmployeeNotificationModel({this.status, this.message, this.notifications});

  EmployeeNotificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['notifications'] != null) {
      json['notifications'].forEach((v) {
        notifications.add(new Notifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.notifications != null) {
      data['notifications'] =
          this.notifications.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notifications {
  int id;
  int type;
  int employeeId;
  String title;
  String body;
  int candateId;
  String jobId;
  MeetingDate meetingDate;
  Null viedoChannelName;
  Null viedoToken;

  Notifications(
      {this.id,
      this.type,
      this.employeeId,
      this.title,
      this.body,
      this.candateId,
      this.jobId,
      this.meetingDate,
      this.viedoChannelName,
      this.viedoToken});

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    employeeId = json['employee_id'];
    title = json['title'];
    body = json['body'];
    candateId = json['candate_id'];
    jobId = json['job_id'];
    meetingDate = json['meeting_date'] != null
        ? new MeetingDate.fromJson(json['meeting_date'])
        : null;
    viedoChannelName = json['viedo_channel_name'];
    viedoToken = json['viedo_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['employee_id'] = this.employeeId;
    data['title'] = this.title;
    data['body'] = this.body;
    data['candate_id'] = this.candateId;
    data['job_id'] = this.jobId;
    if (this.meetingDate != null) {
      data['meeting_date'] = this.meetingDate.toJson();
    }
    data['viedo_channel_name'] = this.viedoChannelName;
    data['viedo_token'] = this.viedoToken;
    return data;
  }
}

class MeetingDate {
  int id;
  String jobId;
  String timeFrom;
  String timeTo;
  int time;
  String date;
  int available;

  MeetingDate(
      {this.id,
      this.jobId,
      this.timeFrom,
      this.timeTo,
      this.time,
      this.date,
      this.available});

  MeetingDate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobId = json['job_id'];
    timeFrom = json['time_from'];
    timeTo = json['time_to'];
    time = json['time'];
    date = json['date'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['job_id'] = this.jobId;
    data['time_from'] = this.timeFrom;
    data['time_to'] = this.timeTo;
    data['time'] = this.time;
    data['date'] = this.date;
    data['available'] = this.available;
    return data;
  }
}



