class AvailableMeetingsCandidateModel {
  bool status;
  String message;
  List<AvailableMeetings> availableMeetings=[];

  AvailableMeetingsCandidateModel({this.status, this.message, this.availableMeetings});

  AvailableMeetingsCandidateModel.fromJson(Map json) {
    status = json['status'];
    message = json['message'];
    if (json['available_Meetings'] != null) {
      json['available_Meetings'].forEach((meeting) {
        availableMeetings.add( AvailableMeetings.fromJson(meeting));
      });
    }
  }

  Map<String, dynamic> toJson() 
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.availableMeetings != null) {
      data['available_Meetings'] =
          this.availableMeetings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AvailableMeetings {
  int id;
  String jobId;
  String timeFrom;
  String timeTo;
  int time;
  String date;
  int available;

  AvailableMeetings(
      {this.id,
      this.jobId,
      this.timeFrom,
      this.timeTo,
      this.time,
      this.date,
      this.available});

  AvailableMeetings.fromJson(Map<String, dynamic> json) {
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
