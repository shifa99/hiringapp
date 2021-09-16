import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/user_chats_cubit/user_chats_states.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/user_chats_cubit/users_chats_model.dart';
import 'package:hiring_app/network/end_points.dart';
import 'package:hiring_app/network/remote/dio_helper.dart';

class UserChatsCubit extends Cubit<UserChatsStates> {
  UserChatsCubit() : super(UserChatsLoadingstate());
  static UserChatsCubit get(context) => BlocProvider.of(context);
  UserChatsModel userChatsModel;
  Future<void> getAllusers() async {
    emit(UserChatsLoadingstate());
    try {
      final response = await DioHelper.getData(
          url: tokenEmployer != null && tokenEmployer != ''
              ? allEmployees
              : allEmployers,
          token: tokenEmployer != null && tokenEmployer != ''
              ? tokenEmployer
              : tokenEmployee);
      userChatsModel = UserChatsModel.fromJson(response.data);
      emit(UserChatsSuccessstate());
    } catch (e) {
      print(e.toString());
      emit(UserChatsErrorstate());
    }
  }
}
