import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/models/employee/available_meetings_model.dart';
import 'package:hiring_app/network/end_points.dart';
import 'package:hiring_app/network/remote/dio_helper.dart';

import 'available_meetings_states.dart';

class AvailableMeetingsCubit extends Cubit<AvailableMeetingsStatesEmployee> {
  AvailableMeetingsCubit() : super(AvailableMeetingsStatesEmployee());
  static AvailableMeetingsCubit get(context) => BlocProvider.of(context);
  AvailableMeetingsCandidateModel availableMeetingsCandidateModel;
  int selectedMeeting;
  Future<void> getAvailableMeetings(int jobId) async {
    emit(AvailableMeetingLoadingState());
    try {
      final response = await DioHelper.getData(
          url: '$availableMeetingsEmployee$jobId', token: tokenEmployee);
      availableMeetingsCandidateModel =
          AvailableMeetingsCandidateModel.fromJson(response.data);
      print(response.data);
      emit(AvailableMeetingSuccessState());
    } catch (e) {
      print(e.toString());
      emit(AvailableMeetingErrorState());
    }
  }

  void changeSelectedMeeting(int idMeeting) {
  
    selectedMeeting = idMeeting;
    emit(AvailableMeetingSuccessState());
  }
}
