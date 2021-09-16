import 'package:flutter/material.dart';
import 'package:hiring_app/models/chat_models/message_model.dart';
import 'package:hiring_app/shared/responsive_ui/device_information.dart';
import 'package:intl/intl.dart';

class BuildBubbleSendMessage extends StatelessWidget 
{
  final MessageModel message;
  final DeviceInformation deviceInfo;
  BuildBubbleSendMessage({ @required this.message,@required this.deviceInfo});
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment:
           MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft:  Radius.circular(15),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start ,
              children: 
              [
                Text(
                  message.message,
                  style: TextStyle(
                    color:  Colors.black,
                  ),
                ),
                Text(
                  DateFormat('yyyy-MM-dd hh:mm')
                      .format(DateTime.parse(message.date)),
                  style: TextStyle(
                    fontSize: deviceInfo.screenHeight * 0.015,
                    color: Colors.black 
                  ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: deviceInfo.screenwidth*0.05,
          ),
        ]);
  }
}
