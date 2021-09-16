import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/models/employer/live_jobs_model.dart';
import 'package:hiring_app/modules/Employee/home/cubit/live_jobs_today_cubit/live_jobs_today_states.dart';
import 'package:hiring_app/network/end_points.dart';
import 'package:hiring_app/network/remote/dio_helper.dart';

class LiveJobsTodayCubit extends Cubit<LiveJobsTodayStates> {
  LiveJobsTodayCubit()
      : super(LiveJobsLoadingState());
  static LiveJobsTodayCubit get(context) => BlocProvider.of(context);
  LiveJobsModel liveJobsModel;
  Future<void> getAllLiveJobs() async {
    emit(LiveJobsLoadingState());
    try 
    {
      final response =
          await DioHelper.getData(url: liveJobs, token: tokenEmployer);
      liveJobsModel = LiveJobsModel.fromJson(response.data);
      emit(LiveJobsSuccessState());
    } catch (e) {
      emit(LiveJobsErrorState());
    }
  }
}
