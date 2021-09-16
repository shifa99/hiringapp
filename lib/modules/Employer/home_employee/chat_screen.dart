import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/models/chat_models/chat_cubit/chat_cubit.dart';
import 'package:hiring_app/models/chat_models/chat_cubit/chat_cubit_states.dart';
import 'package:hiring_app/modules/widgets/build_receive_bubble_message.dart';
import 'package:hiring_app/modules/widgets/build_send_bubble_message.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';

class ChatScreen extends StatelessWidget {
  final empId;
  ChatScreen(this.empId);
  var messageText = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context, title: 'Ahmed Ali'),
      backgroundColor: Colors.grey[200],
      body: responsiveWidget(
        responsive: (context, deviceInfo) => BlocProvider(
          create: (context) => ChatCubit()..getMessages(employerId, empId),
          child: BlocBuilder<ChatCubit, ChatCubitStates>(
              builder: (context, state) {
            bool isMe = true;
            if (state is ChatSuccessState) {
              var chatCubit = ChatCubit.get(context);
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.separated(
                            controller: scrollController,
                            itemBuilder: (context, index) {
                              isMe = chatCubit.messages[index].senderId ==
                                      'employer$employerId'
                                  ? true
                                  : false;
                              return isMe
                                  ? BuildBubbleSendMessage(
                                      message: chatCubit.messages[index],
                                      deviceInfo: deviceInfo,
                                    )
                                  : BuildBubbleReceiveMessage(
                                      message: chatCubit.messages[index],
                                      deviceInfo: deviceInfo);
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 5,
                                ),
                            itemCount: chatCubit.messages.length)),
                  ),
                  Form(
                    key: formKey,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      color: Colors.white,
                      child: defaultFormField(
                        controller: messageText,
                        validator: (message) {
                          if (message.isEmpty)
                            return 'Please Enter Your Message';
                          return null;
                        },
                        type: TextInputType.text,
                        hint: 'write your message',
                        onSubmit: (message) async {
                          if (message.isNotEmpty) {
                            await chatCubit
                                .sendMessage(
                                    messageText.text, employerId, empId)
                                .then((value) {
                              print('Success Firebase');
                            }).catchError((e) {
                              print('Error Is $e');
                            });
                            messageText.clear();
                            scrollController.jumpTo(
                                scrollController.position.maxScrollExtent);
                          }
                        },
                        icon: IconButton(
                            onPressed: () async {
                              if (formKey.currentState.validate()) {
                                await chatCubit.sendMessage(
                                    messageText.text, employerId, empId);
                                messageText.clear();
                                scrollController.jumpTo(
                                    scrollController.position.maxScrollExtent);
                              }
                            },
                            icon: Icon(Icons.send)),
                      ),
                    ),
                  )
                ],
              );
            } else
              return loadingProgress();
          }),
        ),
      ),
    );
  }
}
