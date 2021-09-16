import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/models/employer/available_meetings_model.dart';
import 'package:hiring_app/modules/logins/cubit/available_meetings_cubit/available_meetings_states.dart';
import 'package:hiring_app/network/end_points.dart';
import 'package:hiring_app/network/remote/dio_helper.dart';

class AvailableMeetingsCubit extends Cubit<AvailableMeetingsStates> {
  AvailableMeetingsCubit() : super(IdleAvailableMeetingsStates());
  static AvailableMeetingsCubit get(context) => BlocProvider.of(context);
  AvailableMeetingsModel availableMeetingsJob;
  int selectedMeeting;
  Future<void> getAvailableMeetings(int jobId) async {
    emit(LoadingAvailableMeetingsStates());
    try {
      final response = await DioHelper.getData(
          url: '$availableMeetings=$jobId', token: tokenEmployer);
      availableMeetingsJob = AvailableMeetingsModel.fromJson(response.data);
      
      emit(SuccessAvailableMeetingsStates());
    } catch (e) {
      // print(e.toString());
      emit(ErrorAvailableMeetingsStates());
    }
  }

  void selectMeeting(int selectIdMeeting) {
    selectedMeeting = selectIdMeeting;
    emit(SuccessAvailableMeetingsStates());
  }
  // void getAvailableMeetings()
}
