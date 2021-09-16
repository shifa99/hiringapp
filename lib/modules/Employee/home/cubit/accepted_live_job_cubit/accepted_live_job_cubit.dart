import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/models/employer/accepted_employees_for_live_job_model.dart';
import 'package:hiring_app/modules/Employee/home/cubit/accepted_live_job_cubit/accepted_live_job_states.dart';
import 'package:hiring_app/modules/Employee/home/cubit/live_jobs_today_cubit/live_jobs_today_states.dart';
import 'package:hiring_app/network/end_points.dart';
import 'package:hiring_app/network/remote/dio_helper.dart';

class AcceptedLiveJobsCubit extends Cubit<AcceptedLiveJobsStates> {
  AcceptedLiveJobsCubit()
      : super(LiveJobsAcceptedLoadingState());
  static AcceptedLiveJobsCubit get(context) => BlocProvider.of(context);
  AcceptedEmployeesForLiveJobModel acceptedEmployeesForLiveJobModel;
  Future<void> getAllLiveJobs(int jobJd) async {
    emit(LiveJobsAcceptedLoadingState());
    try 
    {
      final response =
          await DioHelper.getData(url: '$acceptedForThisJob$jobJd', token: tokenEmployer);
      acceptedEmployeesForLiveJobModel = AcceptedEmployeesForLiveJobModel.fromJson(response.data);
      emit(LiveJobsAcceptedSuccessState());
    } catch (e) {
      emit(LiveJobsAcceptedErrorState());
    }
  }
}
