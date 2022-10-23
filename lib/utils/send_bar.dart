import 'package:chat/controller/chat_message_controller.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:chat/model/message_data.dart';

class SendBar extends StatelessWidget {
  const SendBar({
    Key? key,
    required TextEditingController controller,
    required this.socket,
    required this.chatMessageConrtoller,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final IO.Socket socket;
  final ChatMessageConrtoller chatMessageConrtoller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: TextField(
                controller: _controller,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.send_rounded,
              ),
              onPressed: () {
                _sendMessgae(_controller.text);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessgae(String text) {
    // 发送消息并重置输入框
    var messageData =
        MessageData(content: text, socketId: socket.id.toString());
    // 改变chatmessage状态，由于对接的是不同的客户端，因此所有消息都需要加入
    chatMessageConrtoller.chatMessage.add(messageData);
    socket.emit('message', messageData.toJson());
    _controller.text = "";
  }
}
