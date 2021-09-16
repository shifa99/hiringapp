import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/models/chat_models/chat_cubit/chat_cubit_states.dart';
import 'package:hiring_app/models/chat_models/message_model.dart';
import 'package:hiring_app/models/helpers/firebase_helper.dart';
import 'package:hiring_app/network/end_points.dart';
import 'package:hiring_app/network/remote/dio_helper.dart';

class ChatCubit extends Cubit<ChatCubitStates> {
  ChatCubit() : super(ChatIdleState());
  List<MessageModel> messages;
  static ChatCubit get(context) => BlocProvider.of(context);
  Future<void> getMessages(int senderId, int receiverId) async {
    emit(ChatLoadingState());
    try {
      bool isEmployer =
          tokenEmployer != null && tokenEmployer != '' ? true : false;
      messages = [];
      FirebaseHelper.fireStore
          .collection('users')
          .doc(isEmployer ? 'employer$senderId' : 'employe$senderId')
          .collection('chats')
          .doc(isEmployer ? 'employe$receiverId' : 'employer$receiverId')
          .collection('messages')
          .orderBy('date')
          .snapshots()
          .listen((event) {
        messages = [];
        event.docs.forEach((element) {
          messages.add(MessageModel.fromJson(element.data()));
        });
        emit(ChatSuccessState());
      });
    } catch (e) {
      print('Send Error $e');
      emit(ChatErrorState());
    }
  }

  Future<void> sendMessage(String message, int senderId, int receiverId) async {
    try {
      bool isEmployer =
          tokenEmployer != null && tokenEmployer != '' ? true : false;
      MessageModel messageModel = MessageModel(
          senderId: isEmployer ? 'employer$senderId' : 'employe$senderId',
          receiverId: isEmployer ? 'employe$receiverId' : 'employer$receiverId',
          date: DateTime.now().toString(),
          message: message);
      await FirebaseHelper.sendMessage(
              senderId: messageModel.senderId,
              recieverID: messageModel.receiverId,
              data: messageModel.toMap())
          .then((value) {
        print(value.toString());
      });
      await FirebaseHelper.sendMessage(
          senderId: messageModel.receiverId,
          recieverID: messageModel.senderId,
          data: messageModel.toMap());
      //emit(ChatSuccessState());
    } catch (e) {
      print('Error In firebase $e');
    }
  }

  Future<void> createChatWithNewEmployee(int id) async {
    try {
      emit(ChatLoadingState());
      await DioHelper.postData(url: createChatWithEmployee, data: {
        'employee_id': id,
      });
      emit(ChatSuccessState());
    } catch (e) {
      print(e.toString());
      emit(ChatErrorState());
    }
  }

  Future<void> createChatWithNewEmployer(int id) async {
    try {
      emit(ChatLoadingState());
      await DioHelper.postData(url: createChatWithEmployer, data: {
        'employer_id': id,
      });
      emit(ChatSuccessCreateState());
    } catch (e) {
      print(e.toString());
      emit(ChatErrorState());
    }
  }
}
