import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/models/employer/meeting_summery_model.dart';
import 'package:hiring_app/modules/Employee/home/cubit/meeting_summery_cubit/meeting_summery_states.dart';
import 'package:hiring_app/network/end_points.dart';
import 'package:hiring_app/network/remote/dio_helper.dart';

class MeetingSummeryCubit extends Cubit<MeetingSummeryStates> {
  MeetingSummeryCubit() : super(MeetingSummeryLoadingState());
  static MeetingSummeryCubit get(context) => BlocProvider.of(context);
  MeetingSummeryModel meetingSummeryModel;
  Future<void> getMeetingSummeryData() async {
    emit(MeetingSummeryLoadingState());
    try {
      final response =
          await DioHelper.getData(url: meetingSummeryEmployer, token: tokenEmployer);
      meetingSummeryModel = MeetingSummeryModel.fromJson(response.data);
      emit(MeetingSummerySuccessState());
    } catch (e) 
    {
      emit(MeetingSummeryErrorState());
    }
  }
}
