import 'dart:convert';
import 'dart:html';

import 'package:chat/controller/chat_message_controller.dart';
import 'package:chat/model/message_data.dart';
import 'package:chat/widget/chat_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../utils/send_bar.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late TextEditingController _controller;
  late IO.Socket socket;
  var chatmessageController = ChatMessageConrtoller();

  @override
  void initState() {
    // TODO: implement initState
    // 惰性初始化
    _controller = TextEditingController();
    // 打开聊天页面的时候完成初始化的，创建client并连接到服务端
    initSocket();
    receiveMessage();
    super.initState();
  }

  void initSocket() {
    print("sockect start init");
    socket = IO.io(
        'http://localhost:8080',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            // .enableAutoConnect()
            .build());
    socket.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("越狱"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              // 必须要指定flex参数，否则页面报错
              flex: 1,
              // TODO 构建聊天窗
              child: Obx(
                () => ListView.builder(
                    itemCount: chatmessageController.chatMessage.length,
                    itemBuilder: (BuildContext context, int index) {
                      var message = chatmessageController.chatMessage[index];
                      return Align(
                        alignment: message.socketId == socket.id
                            ? Alignment.topRight
                            : Alignment.topLeft,
                        child: ChatMessageBox(
                          content: message.content,
                          socketId: message.socketId,
                        ),
                      );
                    }),
              ),
            ),
            SendBar(
              controller: _controller,
              socket: socket,
              chatMessageConrtoller: chatmessageController,
            )
          ],
        ),
      ),
    );
  }

  void receiveMessage() {
    socket.on('message-receive', (data) {
      // print(MessageData.fromJson(data));
      chatmessageController.chatMessage.add(MessageData.fromJson(data));
    });
  }
}
