import 'package:flutter/cupertino.dart';

class JobDetailsModel {
  int jobId;
  final int fieldJob;
  final String titleJob;
  final String jobDetails;
  final String noteJob;
  final int salary;
  final int gender;
  final int experience;
  final String qualification;
  final String interviewerName;
  final String interviewerRole;
  final String meetingDate;
  final String meetingFrom;
  final String meetingTo;
  final int meetingTime;
  final String numberOfApplicant;

  JobDetailsModel(
      {
      this.jobId,
      @required this.fieldJob,
      @required this.titleJob,
      @required this.jobDetails,
      @required this.noteJob,
      @required this.salary,
      @required this.gender,
      @required this.experience,
      @required this.qualification,
      @required this.interviewerName,
      @required this.interviewerRole,
      @required this.meetingDate,
      @required this.meetingFrom,
      @required this.meetingTo,
      @required this.meetingTime,
      @required this.numberOfApplicant});

  Map<String, dynamic> toMap() {
    return {
      'job_id':this.jobId,
      'field': this.fieldJob,
      'title': this.titleJob,
      'details': this.jobDetails,
      'note': this.noteJob,
      'salary': this.salary,
      'gender': this.gender,
      'experience': this.experience,
      'qualification': this.qualification,
      'interviewer_name': this.interviewerName,
      'interviewer_role': this.interviewerRole,
      'meeting_date': this.meetingDate,
      'meeting_from': this.meetingFrom,
      'meeting_to': this.meetingTo,
      'meeting_time': this.meetingTime,
      'applies': this.numberOfApplicant,
    };
  }
}
