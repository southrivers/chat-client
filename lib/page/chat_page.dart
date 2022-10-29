import 'package:chat/model/message_data.dart';
import 'package:chat/widget/message_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          // 查询后台数据库并构建列表信息
          return MessageView(
            userName: index % 2 == 0 ? "other2" : "other1",
            messageData: MessageData(
                messageData: "hello world ! ni hao a!",
                lastDate: DateTime.now(),
                unreadCount: 10),
          );
        },
      ),
    );
  }
}
