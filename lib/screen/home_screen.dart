import 'package:flutter/material.dart';
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
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return ListView(shrinkWrap: true,

                        // builder来根据消息构建页面
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "hello",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "world",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ]);
                  }),
            ),
            SendBar(
              controller: _controller,
              socket: socket,
            )
          ],
        ),
      ),
    );
  }

  void receiveMessage() {
    socket.on('message', (data) => {print(data)});
  }
}
