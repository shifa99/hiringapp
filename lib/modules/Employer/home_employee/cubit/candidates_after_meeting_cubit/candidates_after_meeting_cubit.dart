import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/models/employer/candidates_after_meeting_model.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/candidates_after_meeting_cubit/candidates_after_meeting_states.dart';
import 'package:hiring_app/network/remote/dio_helper.dart';

class CandidatesAfterMeetingCubit extends Cubit<CandidatesAfterMeetingStates> {
  CandidatesAfterMeetingCubit() : super(CandidatesAfterMeetingLoadingState());
  static CandidatesAfterMeetingCubit get(context) => BlocProvider.of(context);
  CandidatesAfterMeetingModel candidatesAfterMeetingModel;
  Future<void> getCandidatesAfterInterview({int state = 3, int jobId}) async {
    try {
      emit(CandidatesAfterMeetingLoadingState());
      final response = await DioHelper.getData(
          url: 'employer/employees?candat_status=$state&job_id=$jobId',
          token: tokenEmployer);
      candidatesAfterMeetingModel =
          CandidatesAfterMeetingModel.fromJson(response.data);
      emit(CandidatesAfterMeetingSuccessState());
    } catch (e) {
      print(e.toString());
      emit(CandidatesAfterMeetingErrorState());
    }
  }
}
