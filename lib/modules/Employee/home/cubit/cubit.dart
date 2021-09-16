import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/models/employee/employee_job_details_model.dart';
import 'package:hiring_app/models/employee/employee_meetings_model.dart';
import 'package:hiring_app/models/employee/employee_profile_model.dart';
import 'package:hiring_app/models/employee/emplyee_home_model.dart';
import 'package:hiring_app/models/guest_home_model.dart';
import 'package:hiring_app/modules/Employee/home/cubit/states.dart';
import 'package:hiring_app/modules/Employee/home/screens/home_screen.dart';
import 'package:hiring_app/modules/Employee/home/screens/messages_screen.dart';
import 'package:hiring_app/modules/Employee/home/screens/my_schedule_screen/my_schedual_screen.dart';
import 'package:hiring_app/modules/Employee/home/screens/notifications_screen.dart';
import 'package:hiring_app/modules/Employee/home/screens/settings_screen.dart';
import 'package:hiring_app/network/end_points.dart';
import 'package:hiring_app/network/remote/dio_helper.dart';
import 'package:hiring_app/shared/responsive_ui/device_information.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<String> title = [
    'Home',
    'My Schedule',
    'Notifications',
    'Messages',
    'Profile'
  ];
  Widget currentScreen(DeviceInformation deviceInformation) {
    if (currentIndex == 0)
      return HomeScreen();
    else if (currentIndex == 1)
      return MySchedualScreen();
    else if (currentIndex == 2)
      return NotificationsScreen(deviceInformation);
    else if (currentIndex == 3)
      return MessagesScreen();
    else
      return SettingsScreen();
  }

  void changeIndex(int index) {
    if (index != currentIndex) {
      currentIndex = index;
      emit(AppChangeBottomNavBarState());
    }
  }

  EmployeeProfileModel employeeProfileModel = EmployeeProfileModel();

  void getProfile() async {
    emit(GetEmployeeProfileLoadingState());
    await DioHelper.getData(
      url: EMPLOYEEPROFILE,
      token: tokenEmployee,
    ).then((value) {
      print('all profile data :${value.data}');
      employeeProfileModel = EmployeeProfileModel.fromJson(value.data);
      print('msg :${employeeProfileModel.message}');
      emit(GetEmployeeProfileSuccessState());
    }).catchError((error) {
      print('Error : ' + error.toString());
      emit(GetEmployeeProfileErrorState());
    });
  }

  void updateEmployeeProfile({
    String fullName,
    String university,
    String email,
    String country,
    String city,
    String titleJob,
    String studyField,
    String qualification,
  }) async {
    emit(UpdateEmployeeProfileLoadingState());

    await DioHelper.postData(
        url: EMPLOYEEPROFILEUPDATE,
        token: tokenEmployee,
        data: {
          'fullName': fullName,
          'university': university,
          'email': email,
          'country': country,
          'city': city,
          'title': titleJob,
          'study_field': studyField,
          'qualification': qualification,
        }).then((value) {
      print('updated :${value.data}');
      getProfile();
      emit(UpdateEmployeeProfileSuccessState());
    }).catchError((e) {
      print('Error update $e');
      emit(UpdateEmployeeProfileErrorState());
    });
  }

  HomeEmployeeModel homeEmployeeModel = HomeEmployeeModel();

  void getHomeData() async {
    emit(GetEmployeeHomeDataLoadingState());

    await DioHelper.getData(url: HOMEEMPLOYEE, token: tokenEmployee)
        .then((value) {
      print('Home Data :${value.data}');
      homeEmployeeModel = HomeEmployeeModel.fromJson(value.data);
      emit(GetEmployeeHomeDataSuccessState());
    }).catchError((e) {
      print('Home E:$e');
      emit(GetEmployeeHomeDataErrorState());
    });
  }

  HomeGuestModel homeGuestModel = HomeGuestModel();

  void getJustHomeData() async {
    emit(GetGuestHomeDataLoadingState());

    if (isGuest) {
      await DioHelper.getData(
        url: GUESTHome,
      ).then((value) {
        print('Home Guest Data :${value.data}');
        homeGuestModel = HomeGuestModel.fromJson(value.data);
        emit(GetGuestHomeDataSuccessState());
      }).catchError((e) {
        print('Home Guest E:$e');
        emit(GetGuestHomeDataErrorState());
      });
    } else {
      print('is not Guest');
    }
  }

  JobDetailsEmployeeModel jobDetailsEmployeeModel = JobDetailsEmployeeModel();

  Future<void> getJobDetails({var id}) async {
    if (isGuest) {
      print('is Guest');
    } else {
      emit(GetJobDetailsEmployeeHomeDataLoadingState());

      await DioHelper.getData(
              url: '$EMPLOYEEJobDetail$id', token: tokenEmployee)
          .then((value) {
        print('Job Details Data :${value.data}');
        jobDetailsEmployeeModel = JobDetailsEmployeeModel.fromJson(value.data);
        print(
            'Model job :${jobDetailsEmployeeModel.jobDetails.employer.fullName}');
        emit(GetJobDetailsEmployeeHomeDataSuccessState());
      }).catchError((e) {
        print('Home E:$e');
        emit(GetJobDetailsEmployeeHomeDataErrorState());
      });
    }
  }

  void getGuestJobDetails({var id}) async {
    emit(GetJobDetailsEmployeeHomeDataLoadingState());
    if (isGuest) {
      await DioHelper.getData(
        url: '$GUESTJobDetail$id',
      ).then((value) {
        print('Job Details Data :${value.data}');
        jobDetailsEmployeeModel = JobDetailsEmployeeModel.fromJson(value.data);
        print(
            'Model job :${jobDetailsEmployeeModel.jobDetails.employer.fullName}');
        emit(GetJobDetailsEmployeeHomeDataSuccessState());
      }).catchError((e) {
        print('Home E:$e');
        emit(GetJobDetailsEmployeeHomeDataErrorState());
      });
    } else {
      print('not Guest');
    }
  }

  Future<bool> applyJob({int jobId}) async {
    emit(JobApplyEmployeeHomeDataLoadingState());
    try {
      final response = await DioHelper.postData(
          url: EMPLOYEEApply, token: tokenEmployee, data: {'job_id': jobId});
      print('Enrolled');
      print(response.data);
      if (response.data['status']) {
        emit(JobApplyEmployeeHomeDataSuccessState());
        return true;
      } else {
        emit(JobApplyEmployeeHomeDataSuccessState());
        return false;
      }
    } catch (e) {
      print('Apply E:$e');
      emit(JobApplyEmployeeHomeDataErrorState());
      return false;
    }
  }

  

}
