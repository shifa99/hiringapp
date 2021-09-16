import 'package:flutter/material.dart';
import 'package:hiring_app/models/chat_models/message_model.dart';
import 'package:hiring_app/shared/responsive_ui/device_information.dart';
import 'package:intl/intl.dart';

class BuildBubbleReceiveMessage extends StatelessWidget 
{
  final MessageModel message;
  final DeviceInformation deviceInfo;
  BuildBubbleReceiveMessage({ @required this.message,@required this.deviceInfo});
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment:
            MainAxisAlignment.start ,
        children: [
          CircleAvatar(
            radius: deviceInfo.screenwidth*0.05,
          ),
          Container(
            decoration: BoxDecoration(
              color:  Color(0xFFdbefff) ,
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
                   CrossAxisAlignment.start,
              children: 
              [
                Text(
                  message.message,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  DateFormat('yyyy-MM-dd hh:mm')
                      .format(DateTime.parse(message.date)),
                  style: TextStyle(
                    fontSize: deviceInfo.screenHeight * 0.0165,
                    color:  Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ]);
  }
}
