import 'package:flutter/cupertino.dart';

class MessageModel {
  final String senderId;
  final String receiverId;
  final String message;
  final String date;

  MessageModel(
      {@required this.senderId,
      @required this.receiverId,
      @required this.message,
      @required this.date});

  Map<String, dynamic> toMap() {
    return {
      'sender': senderId,
      'receiver': receiverId,
      'message': message,
      'date': date,
    };
  }

  factory MessageModel.fromJson(Map<String, dynamic> message) 
  {
    return MessageModel(
        senderId: message['sender'],
        receiverId: message['receiver'],
        message: message['message'],
        date: message['date']);
  }
}
