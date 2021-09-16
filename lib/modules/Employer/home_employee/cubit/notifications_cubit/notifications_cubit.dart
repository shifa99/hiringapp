import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/models/employee/employee_notfication_model.dart';
import 'package:hiring_app/network/remote/dio_helper.dart';

import 'notifications_states_cubit.dart';

class NotificationCubit extends Cubit<NotificationStatesCubit> {
  NotificationCubit() : super(NotificationLoadingState());
  static NotificationCubit get(context) => BlocProvider.of(context);
  EmployeeNotificationModel employeeNotificationModel;
  Future<void> getNotifications() async {
    emit(NotificationLoadingState());
    try {
      final response =
          await DioHelper.getData(url: 'notification', token: tokenEmployee);
      employeeNotificationModel =
          EmployeeNotificationModel.fromJson(response.data);
      emit(NotificationSuccessState());
    } catch (e) {
      emit(NotificationErrorState());
    }
  }
}
