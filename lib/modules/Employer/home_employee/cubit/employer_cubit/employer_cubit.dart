import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/models/employee/employee_job_details_model.dart';
import 'package:hiring_app/models/employer/candidates_model.dart';
import 'package:hiring_app/models/employer/employer_profile_login.dart';
import 'package:hiring_app/models/employer/emplyer_home_model.dart';
import 'package:hiring_app/models/employer/job_details_model.dart';
import 'package:hiring_app/models/employer/my_schedule_model.dart';
import 'package:hiring_app/models/employer/show_employee_model.dart';
import 'package:hiring_app/modules/Employee/home/screens/home_screen.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/states.dart';
import 'package:hiring_app/modules/Employer/home_employee/screens/create_job_screen.dart';
import 'package:hiring_app/modules/Employer/home_employee/screens/home_employer_screen/home_employer_screen.dart';
import 'package:hiring_app/modules/Employer/home_employee/screens/messages_employer_screen.dart';
import 'package:hiring_app/modules/Employer/home_employee/screens/schedule_employer_screen.dart';
import 'package:hiring_app/modules/Employer/home_employee/screens/settings_employer_screen.dart';
import 'package:hiring_app/network/end_points.dart';
import 'package:hiring_app/network/local/cache_helper.dart';
import 'package:hiring_app/network/remote/dio_helper.dart';

import '../../../../who_are_you_screen.dart';

class AppEmployerCubit extends Cubit<AppEmployerStates> {
  AppEmployerCubit() : super(AppEmployeeInitialState());

  static AppEmployerCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<String> title = ['Setting', 'Meeting', 'Add', 'Messages', 'Profile'];

  Widget currentScreen() {
    if (currentIndex == 0)
      return HomeEmployerScreen();
    else if (currentIndex == 1)
      return ScheduleEmployerScreen();
    else if (currentIndex == 2)
      return CreateJobScreen();
    else if (currentIndex == 3)
      return MessagesEmployerScreen();
    else
      return ProfileEmployerScreen();
  }

  void changeIndex(int index) {
    if (index != currentIndex) {
      currentIndex = index;
      emit(AppEmployeeChangeBottomNavBarState());
    }
  }

  HomeEmployerModel homeEmployerModel = HomeEmployerModel();

  Future<void> logoutEmployer(BuildContext context) async {
    print(tokenEmployer);
    await DioHelper.postData(
      url: EMPLOYERLOGOUT,
      data: {},
      token: tokenEmployer,
    ).then((value) {
      if (value.data['status'] == false) {
        print(value.data);

        print(value.data['status']);
      } else {
        print(value.data['status']);
        CacheHelper.removeData(key: 'tokenEmployer');
        navigateAndFinish(context, WhoAreYouScreen());
        tokenEmployer = '';
        print('token $tokenEmployer');
      }
    }).catchError((e) {
      print('logout Error : $e');
    });
  }

  void getEmployerHomeData() {
    emit(GetEmployerHomeDataLoadingState());

    DioHelper.getData(url: EMPLOYERHome, token: tokenEmployer).then((value) {
      //   print('Home Employer Data :${value.data}');

      homeEmployerModel = HomeEmployerModel.fromJson(value.data);
      print('length ${homeEmployerModel.myJob.length}');
      //author Jobs is okay

      emit(GetEmployerHomeDataSuccessState());
    }).catchError((e) {
      print('Home Employer E:$e');
      emit(GetEmployerHomeDataErrorState());
    });
  }

  MyScheduleModel myScheduleModel = MyScheduleModel();

  void getMyScheduleData() async 
  {
    emit(GetMuScheduleDataLoadingState());
    await DioHelper.getData(url: EMPLOYERMySchedule, token: tokenEmployer)
        .then((value) {
      print('MySchedule Data :${value.data}');
      myScheduleModel = MyScheduleModel.fromJson(value.data);
      emit(GetMuScheduleDataSuccessState());
    }).catchError((e) {
      print('MySchedule E:$e');
      emit(GetMuScheduleDataErrorState());
    });
  }

  JobDetailsModel jobDetailsModel;
  Future<void> createNewJob(
      {int fieldJob,
      String titleJob,
      String jobDetails,
      String noteJob,
      int salary,
      int gender,
      int experience,
      String qualification,
      String interviewerName,
      String interviewerRole,
      String meetingDate,
      String meetingFrom,
      String meetingTo,
      int meetingTime,
      String numberOfApplicant}) async {
    jobDetailsModel = JobDetailsModel(
        fieldJob: fieldJob,
        titleJob: titleJob,
        jobDetails: jobDetails,
        noteJob: noteJob,
        salary: salary,
        gender: gender,
        experience: experience,
        qualification: qualification,
        interviewerName: interviewerName,
        interviewerRole: interviewerRole,
        meetingDate: meetingDate,
        meetingFrom: meetingFrom,
        meetingTo: meetingTo,
        meetingTime: meetingTime,
        numberOfApplicant: numberOfApplicant);
    emit(LoadingCreateJobState());
    await DioHelper.postData(
            url: employerCreateJob,
            data: jobDetailsModel.toMap(),
            token: tokenEmployer)
        .then((value) {
      print(value);
      emit(SuccessCreateJobState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorCreateJobState());
    });
  }

  Future<bool> updateJob(
      {int indexJob,
      int jobId,
      int fieldJob,
      String titleJob,
      String jobDetails,
      String noteJob,
      int salary,
      int gender,
      int experience,
      String qualification,
      String interviewerName,
      String interviewerRole,
      String meetingDate,
      String meetingFrom,
      String meetingTo,
      int meetingTime,
      String numberOfApplicant}) async {
    myScheduleModel.schedule[indexJob] = Schedule(
      id: jobId,
      jobField: myScheduleModel.schedule[indexJob].jobField,
      applies: myScheduleModel.schedule[indexJob].applies,
      employeejobCount: myScheduleModel.schedule[indexJob].employeejobCount,
      employer: myScheduleModel.schedule[indexJob].employer,
      status: myScheduleModel.schedule[indexJob].status,
      title: titleJob,
      details: jobDetails,
      note: noteJob,
      salary: salary,
      gender: gender,
      experience: experience,
      qualification: qualification,
      interviewerName: interviewerName,
      interviewerRole: interviewerRole,
      meetingDate: meetingDate,
      meetingTime: meetingTime,
      meetingEnd: meetingTo,
      startFrom: meetingFrom,
    );
    try {
      jobDetailsModel = JobDetailsModel(
          jobId: jobId,
          fieldJob: fieldJob,
          titleJob: titleJob,
          jobDetails: jobDetails,
          noteJob: noteJob,
          salary: salary,
          gender: gender,
          experience: experience,
          qualification: qualification,
          interviewerName: interviewerName,
          interviewerRole: interviewerRole,
          meetingDate: meetingDate,
          meetingFrom: meetingFrom,
          meetingTo: meetingTo,
          meetingTime: meetingTime,
          numberOfApplicant: numberOfApplicant);
      emit(LoadingEditJobState());
      final response = await DioHelper.postData(
          url: employerEditJob,
          data: jobDetailsModel.toMap(),
          token: tokenEmployer);
      if (response.data['status']) {
        emit(SuccessEditJobState());
        emit(GetMuScheduleDataSuccessState());
        return true;
      } else {
        emit(SuccessDeleteJobState());
        return false;
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorEditJobState());
    }
  }

  Future<bool> deleteJob(int id) async {
    emit(LoadingDeleteJobState());
    try {
      final response = await DioHelper.postData(
          url: employerDeleteJob, data: {'job_id': id}, token: tokenEmployer);
      bool responseValue = response.data['status'];
      if (responseValue) {
        emit(SuccessDeleteJobState());
        return true;
      } else {
        emit(SuccessDeleteJobState());
        return false;
      }
    } catch (e) {
      emit(ErrorDeleteJobState());
      return false;
    }
  }

  EmployerProfileModel employerProfileModel = EmployerProfileModel();

  void getProfile() {
    emit(GetEmployerProfileLoadingState());
    print('Employer Token :$tokenEmployer');
    DioHelper.getData(url: EMPLOYERPROFILE, token: tokenEmployer).then((value) {
      print('Profile Data :${value.data}');
      employerProfileModel = EmployerProfileModel.fromJson(value.data);
      print(employerProfileModel.message);
      emit(GetEmployerProfileSuccessState());
    }).catchError((e) {
      print('Profile Error :$e');
      emit(GetEmployerProfileErrorState());
    });
  }

  CandidatesModel candidatesModel = CandidatesModel();
  List<Candidate> filteredCandidats = [];
  int savedIndex = 0;
  void getCandidates(
      {int selectedEmployeeIndex = 0, @required int jobId}) async {
    emit(GetCandidatesLoadingState());
    try {
      savedIndex = selectedEmployeeIndex;
      final response = await DioHelper.getData(
        url:
            '$EMPLOYERCandidates?candat_status=$selectedEmployeeIndex&&job_id=$jobId',
        token: tokenEmployer,
      );
      candidatesModel = CandidatesModel.fromJson(response.data);
      print(response.data);
      filteredCandidats = candidatesModel.candidates;
      emit(GetCandidatesSuccessState());
    } catch (e) {
      print('Candidates Error :$e');
      emit(GetCandidatesErrorState());
    }
    //
  }

  void filterCandidate(
      {String qualification,
      int experience,
      int startAge,
      int endAge,
      String gender}) {
    int typePerson = gender == 'Male' ? 0 : 1;
    candidatesModel.candidates = candidatesModel.candidates.where((candidate) {
      print(experience);
      if (experience != null &&
          qualification == null &&
          startAge == null &&
          gender == null) {
        if (candidate.employee.experience >= experience) return true;
      } else if (experience == null &&
          qualification != null &&
          startAge == null &&
          gender == null) {
        if (candidate.employee.qualification == qualification) return true;
      } else if (experience == null &&
          qualification == null &&
          startAge == null &&
          gender != null) {
        if (candidate.employee.gender == typePerson) return true;
      } else if (experience == null &&
          qualification == null &&
          startAge != null &&
          gender == null) {
        if (candidate.employee.age >= startAge &&
            candidate.employee.age <= endAge) return true;
      } else if (experience == null &&
          qualification == null &&
          startAge != null &&
          gender != null) {
        if (candidate.employee.age >= startAge &&
            candidate.employee.age <= endAge &&
            candidate.employee.gender == typePerson) return true;
      } else if (experience != null &&
          qualification == null &&
          startAge != null &&
          gender != null) {
        if (candidate.employee.experience >= experience &&
            candidate.employee.age >= startAge &&
            candidate.employee.age <= endAge &&
            candidate.employee.gender == typePerson) return true;
      } else if (experience == null &&
          qualification != null &&
          startAge != null &&
          gender != null) {
        if (candidate.employee.qualification == qualification &&
            candidate.employee.age >= startAge &&
            candidate.employee.age <= endAge &&
            candidate.employee.gender == typePerson) return true;
      } else if (experience != null &&
          qualification != null &&
          startAge != null &&
          gender == null) {
        if (candidate.employee.experience >= experience &&
            candidate.employee.qualification == qualification &&
            candidate.employee.age >= startAge &&
            candidate.employee.age <= endAge) return true;
      } else if (experience != null &&
          qualification != null &&
          startAge == null &&
          gender == null) {
        if (candidate.employee.experience >= experience &&
            candidate.employee.qualification == qualification) return true;
      } else if (experience != null &&
          qualification == null &&
          startAge == null &&
          gender != null) {
        if (candidate.employee.experience >= experience &&
            candidate.employee.gender == typePerson) return true;
      } else if (experience != null &&
          qualification == null &&
          startAge != null &&
          gender == null) {
        if (candidate.employee.experience >= experience &&
            candidate.employee.age >= startAge &&
            candidate.employee.age <= endAge) return true;
      } else if (experience == null &&
          qualification != null &&
          startAge == null &&
          gender != null) {
        if (candidate.employee.qualification == qualification &&
            candidate.employee.gender == typePerson) return true;
      }
      return false;
    }).toList();
    print('LengthAfterFilter');
    print(candidatesModel.candidates.length);

    emit(GetCandidatesSuccessState());
  }

  ShowEmployeeModel showEmployeeModel = ShowEmployeeModel();

  void showEmployeeProfile({int id = 1}) {
    emit(ShowEmployeeProfileLoadingState());
    // print('Employer Token :$tokenEmployer');
    DioHelper.getData(
      url: '$SHOWEmployeeProfile$id',
      token: tokenEmployer,
    ).then((value) {
      showEmployeeModel = ShowEmployeeModel.fromJson(value.data);
      emit(ShowEmployeeProfileSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(ShowEmployeeProfileErrorState());
    });
  }

  Future<bool> acceptOrRejectEmployeeForInterview(
      {@required int candidateId,
      @required int state,
      int availableMeetingId}) async {
    try {
      emit(LoadingAcceptOrRejectJobState());
      final response = await DioHelper.postData(
          url: acceptOrRejectEmployee,
          data: {
            'candat_id': candidateId,
            'avmeeting_id': availableMeetingId,
            'status': state,
          },
          token: tokenEmployer);
      if (response.data['status']) {
        print('Accepted ${response.data}');
        emit(SuccessAcceptOrRejectJobState());
        return true;
      } else {
        emit(ErrorAcceptOrRejectJobState());
        return false;
      }
    } catch (e) {
      emit(ErrorAcceptOrRejectJobState());
    }
  }

  bool internetConnect = true;

  Future<void> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        internetConnect = true;
        print('connected');
      }
    } on SocketException catch (error) {
      internetConnect = false;

      print('not connected : $error');
    }
  }
}
