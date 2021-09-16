import 'package:flutter/cupertino.dart';

class AvailableMeetingsModel 
{
  bool state;
  String message;
  AvailableMeetingsJob availableMeetingsJob;
  AvailableMeetingsModel(
      {@required this.state,
      @required this.availableMeetingsJob,
      @required this.message});
  factory AvailableMeetingsModel.fromJson(Map data) 
  {
    return AvailableMeetingsModel(
        state: data['status'],
        availableMeetingsJob: AvailableMeetingsJob.fromJson(data['job']),
        message: data['message']);
  }
}

class AvailableMeetingsJob {
  int jobId;
  String employerId;
  String categoryId;
  String title;
  String details;
  String note;
  int salary;
  int gender;
  int experience;
  String qualification;
  String interviewerName;
  String interviewerRole;
  String meetingDate;
  String meetingFrom;
  String meetingTo;
  int meetingTime;
  String status;
  int applies;
  List<AvailableMeeting> availableMeetings = [];
  AvailableMeetingsJob.fromJson(Map data) {
    jobId = data['id'];
    employerId = data['employer_id'];
    categoryId = data['category_id'];
    title = data['title'];
    details = data['details'];
    note = data['note'];
    salary = data['salary'];
    gender = data['gender'];
    experience = data['experience'];
    qualification = data['qualification'];
    interviewerName = data['interviewer_name'];
    interviewerRole = data['interviewer_role'];
    meetingDate = data['meeting_date'];
    meetingFrom = data['meeting_from'];
    meetingTo = data['meeting_to'];
    meetingTime = data['meeting_time'];
    status = data['status'];
    applies = data['applies'];
    print('Error');
    data['avmeetings'].forEach((meeting) {
      availableMeetings.add(AvailableMeeting.fromJson(meeting));
    });
    print('After Error');
  }
}

class AvailableMeeting {
  final int id;
  final String jobId;
  final String timeFrom;
  final String timeTo;
  final int available;
  final int meetingTime;
  final String dateDay;

  AvailableMeeting({
    @required this.dateDay,
    @required this.id,
    @required this.available,
    @required this.jobId,
    @required this.timeFrom,
    @required this.timeTo,
    @required this.meetingTime,
  });
  factory AvailableMeeting.fromJson(Map data) {
    return AvailableMeeting(
      dateDay: data['date'],
      id: data['id'],
      available: data['available'],
      jobId: data['job_id'],
      timeFrom: data['time_from'],
      timeTo: data['time_to'],
      meetingTime: data['time'],
    );
  }
}
