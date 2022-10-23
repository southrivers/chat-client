import 'package:flutter/material.dart';

@immutable
class MessageData {
  final String content;
  final String socketId;

  MessageData({required this.content, required this.socketId});

  Map<String, dynamic> toJson() => {
        'content': content,
        'socketId': socketId,
      };

// 这是什么写法？？？？
  factory MessageData.fromJson(Map<String, dynamic> jsonData) {
    return MessageData(
        content: jsonData["content"], socketId: jsonData["socketId"]);
  }
}
