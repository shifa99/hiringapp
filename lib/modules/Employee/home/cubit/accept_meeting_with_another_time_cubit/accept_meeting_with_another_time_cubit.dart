import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/modules/Employee/home/cubit/accept_meeting_with_another_time_cubit/accept_meeting_with_another_time_states.dart';
import 'package:hiring_app/network/end_points.dart';
import 'package:hiring_app/network/remote/dio_helper.dart';

class AcceptMeetingWithAnotherTimeCubit
    extends Cubit<AcceptMeetingWithAnotherTimeStates> {
  AcceptMeetingWithAnotherTimeCubit()
      : super(AcceptMeetingWithAnotherTimeIdleState());
  static AcceptMeetingWithAnotherTimeCubit get(context) =>
      BlocProvider.of(context);
  Future<bool> changeMeetingTime(int candidateId, int meetingId) async {
    emit(AcceptMeetingWithAnotherTimeLoadingState());
    try {
      final response = await DioHelper.postData(
          token: tokenEmployee,
          url: acceptOfferWithAuthorMeetingTime,
          data: {
            'candat_id': candidateId,
            'meetings_time': meetingId,
          });
      print(response.data);
      emit(AcceptMeetingWithAnotherTimeSuccessState());
      print(response.data['status']);
      return response.data['status'];
    } catch (e) {
      emit(AcceptMeetingWithAnotherTimeErrorState());
      return false;
    }
  }
}
