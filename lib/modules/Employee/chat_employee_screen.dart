// import 'package:flutter/material.dart';
// import 'package:hiring_app/components/components.dart';

// class ChatEmployeeScreen extends StatelessWidget {
//   bool isMe = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: defaultAppBar(context, title: 'Ahmed Ali'),
//       backgroundColor: Colors.grey[200],
//       body: Column(
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListView(
//                 physics: BouncingScrollPhysics(),
//                 children: [
//                   Stack(
//                     children: [
//                       Row(
//                         mainAxisAlignment: !isMe
//                             ? MainAxisAlignment.end
//                             : MainAxisAlignment.start,
//                         children: [
//                           CircleAvatar(
//                             radius: 25,
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                               color: !isMe ? Color(0xFFdbedf3) : Colors.white,
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(15),
//                                 topRight: Radius.circular(15),
//                                 bottomLeft: isMe
//                                     ? Radius.circular(0)
//                                     : Radius.circular(15),
//                                 bottomRight: !isMe
//                                     ? Radius.circular(0)
//                                     : Radius.circular(15),
//                               ),
//                             ),
//                             width: MediaQuery.of(context).size.width * 0.70,
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 10, horizontal: 16),
//                             margin: EdgeInsets.symmetric(
//                                 vertical: 5, horizontal: 10),
//                             child: Column(
//                               crossAxisAlignment: !isMe
//                                   ? CrossAxisAlignment.start
//                                   : CrossAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero ',
//                                   style: TextStyle(
//                                     color: isMe ? Colors.black : Colors.white,
//                                   ),
//                                   textAlign:
//                                       isMe ? TextAlign.start : TextAlign.end,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                     overflow: Overflow.visible,
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Stack(
//                     children: [
//                       Row(
//                         mainAxisAlignment: isMe
//                             ? MainAxisAlignment.end
//                             : MainAxisAlignment.start,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: isMe
//                                   ? Color(0xFFdbedf3)
//                                   : Theme.of(context).accentColor,
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(15),
//                                 topRight: Radius.circular(15),
//                                 bottomLeft: !isMe
//                                     ? Radius.circular(0)
//                                     : Radius.circular(15),
//                                 bottomRight: isMe
//                                     ? Radius.circular(0)
//                                     : Radius.circular(15),
//                               ),
//                             ),
//                             width: MediaQuery.of(context).size.width * 0.70,
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 10, horizontal: 16),
//                             margin: EdgeInsets.symmetric(
//                                 vertical: 5, horizontal: 10),
//                             child: Column(
//                               crossAxisAlignment: isMe
//                                   ? CrossAxisAlignment.start
//                                   : CrossAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   'Lorem ipsum dolor ',
//                                   style: TextStyle(
//                                     color: isMe ? Colors.black : Colors.white,
//                                   ),
//                                   textAlign:
//                                       isMe ? TextAlign.start : TextAlign.end,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           CircleAvatar(
//                             radius: 25,
//                           ),
//                         ],
//                       ),
//                     ],
//                     overflow: Overflow.visible,
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Center(
//                       child: Text(
//                     'Jun 17 2021',
//                     style: TextStyle(fontSize: 12, color: Colors.grey),
//                   )),
//                   Stack(
//                     children: [
//                       Row(
//                         mainAxisAlignment: isMe
//                             ? MainAxisAlignment.end
//                             : MainAxisAlignment.start,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: isMe
//                                   ? Color(0xFFdbedf3)
//                                   : Theme.of(context).accentColor,
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(15),
//                                 topRight: Radius.circular(15),
//                                 bottomLeft: !isMe
//                                     ? Radius.circular(0)
//                                     : Radius.circular(15),
//                                 bottomRight: isMe
//                                     ? Radius.circular(0)
//                                     : Radius.circular(15),
//                               ),
//                             ),
//                             width: MediaQuery.of(context).size.width * 0.70,
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 10, horizontal: 16),
//                             margin: EdgeInsets.symmetric(
//                                 vertical: 5, horizontal: 10),
//                             child: Column(
//                               crossAxisAlignment: isMe
//                                   ? CrossAxisAlignment.start
//                                   : CrossAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam  oluptua. At vero Lorem ipsum dolor sit ametvoluptua. At vero Lorem ipsum dolor sit amet, ',
//                                   style: TextStyle(
//                                     color: isMe ? Colors.black : Colors.white,
//                                   ),
//                                   textAlign:
//                                       isMe ? TextAlign.start : TextAlign.end,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           CircleAvatar(
//                             radius: 25,
//                           ),
//                         ],
//                       ),
//                     ],
//                     overflow: Overflow.visible,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(10),
//             width: double.infinity,
//             color: Colors.white,
//             child: defaultFormField(
//                 // controller: searchController,
//                 validator: (String val) {},
//                 type: TextInputType.text,
//                 hint: 'write your message',
//                 icon: Icon(Icons.message_outlined)
//                 // pIcon: Icon(Icons.rate_review_outlined),
//                 // sIcon: Icon(Icons.mic_outlined),
//                 // label: 'يرجى وصف المشكلة',
//                 ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/models/chat_models/chat_cubit/chat_cubit.dart';
import 'package:hiring_app/models/chat_models/chat_cubit/chat_cubit_states.dart';
import 'package:hiring_app/modules/widgets/build_receive_bubble_message.dart';
import 'package:hiring_app/modules/widgets/build_send_bubble_message.dart';
import 'package:hiring_app/shared/responsive_ui/responsive_widget.dart';

class ChatEmployeeScreen extends StatelessWidget {
  final int employerrId;
  ChatEmployeeScreen(this.employerrId);
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
          create: (context) => ChatCubit()..getMessages(1, employerrId),
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
                                      'employer$employerrId'
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
                            await chatCubit.sendMessage(
                                messageText.text, 1, employerrId);
                            messageText.clear();
                            scrollController.jumpTo(
                                scrollController.position.maxScrollExtent);
                          }
                        },
                        icon: IconButton(
                            onPressed: () async 
                            {
                              if (formKey.currentState.validate()) 
                              {
                                await chatCubit.sendMessage(
                                    messageText.text, 1, employerrId);
                                messageText.clear();
                                FocusScope.of(context).unfocus();
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
