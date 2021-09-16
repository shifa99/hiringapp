// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/models/employee/employee_meetings_model.dart';
import 'package:hiring_app/network/end_points.dart';
import 'package:hiring_app/network/remote/dio_helper.dart';

import 'get_confirmed_meetings_cubit_states.dart';

class GetMyScheduleEmployeeMeetingsCubit extends Cubit<MyScheduleMeetings> {
  GetMyScheduleEmployeeMeetingsCubit()
      : super(GetNotConfirmedMeetingsLoadingState());
  static GetMyScheduleEmployeeMeetingsCubit get(context) => BlocProvider.of(context);

EmployeeMeetingsModel employeeMeetingModel;
  Future<void> getMyScheduleEmployeeMeetings() async 
  {
    emit(GetNotConfirmedMeetingsLoadingState());
    try 
    {
      final response = await DioHelper.getData(
          url: myScheduleEmployee, token: tokenEmployee);
      employeeMeetingModel =
          EmployeeMeetingsModel.fromJson(response.data);
      emit(GetNotConfirmedMeetingsSuccussState());
    } catch (e) {
      print(e.toString());
      emit(GetNotConfirmedMeetingsErrorState());
    }
  }
 

}
