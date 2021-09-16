import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/filteration_cubit/filteration_cubit_states.dart';

class FilterationCubit extends Cubit<FilterationCubitStates> {
  FilterationCubit() : super(IdleFilterationState());
  static FilterationCubit get(context) => BlocProvider.of(context);
  List<bool> filtertypes = [false, false, false, false];
  double experienceYears = 1;
  List<String> qualificationList = ['CS', 'IS', 'SC'];
  String selectedQualification = 'CS';
  List<String> gender = ['Male', 'Female'];
  String selectedGender = 'Male';
  double startAge = 18;
  double endAge = 60;
  void changeFilter(int index, bool toggleValue) {
    filtertypes[index] = toggleValue;
    emit(ChooseFilterationState());
  }

  void changeAge(RangeValues range) {
    startAge = range.start;
    endAge = range.end;
    emit(ChooseAgeState());
  }

  void changeExperiecneYears(double experience) {
    experienceYears = experience;
    print(experienceYears);
    emit(ChooseExperienceYearsState());
  }

  void changeQualificationDegree(String qualification) {
    selectedQualification = qualification;
    emit(ChooseQualificationState());
  }

  void changeGender(String gender) {
    selectedGender = gender;
    emit(ChooseGenderState());
  }
}
