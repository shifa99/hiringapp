import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/modules/Employee/home/cubit/accept_meeting_time_cubit/accept_meeting_time_states.dart';
import 'package:hiring_app/network/end_points.dart';
import 'package:hiring_app/network/remote/dio_helper.dart';

class AcceptMeetingTimeCubit extends Cubit<AcceptMeetingTimeCubitStates> {
  AcceptMeetingTimeCubit() : super(AcceptMeetingTimeIdlestate());
  static AcceptMeetingTimeCubit get(context) => BlocProvider.of(context);
  Future<bool> acceptTimeMeetingOffer(int jobId) async {
    emit(AcceptMeetingTimeLoadingstate());
    try {
      final response = await DioHelper.postData(
          url: acceptTimeMeeting,
          data: {'candat_id': jobId},
          token: tokenEmployee);
      print(response.data);
      print(response.data['status']);
      if (response.data['status']) {
        emit(AcceptMeetingTimeSucssesstate());
        return true;
      } else {
        emit(AcceptMeetingTimeSucssesstate());
        return false;
      }
    } catch (e) {
      emit(AcceptMeetingTimeErrorstate());
      return false;
    }
  }
}
