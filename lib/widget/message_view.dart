import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';

import '../model/message_data.dart';

class MessageView extends StatelessWidget {
  const MessageView({
    super.key,
    required this.userName,
    required this.messageData,
  });
  final String userName;
  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Row(children: [
        Text(userName),
        Gap(10),
        Expanded(
          child: Text(
            messageData.messageData,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Column(
            children: [
              Text(messageData.unreadCount.toString()),
              Text(messageData.lastDate.hour.toString()),
            ],
          ),
        ),
      ]),
    );
  }
}
