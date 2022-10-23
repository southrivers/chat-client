import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SendBar extends StatelessWidget {
  const SendBar({
    Key? key,
    required TextEditingController controller,
    required this.socket,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final IO.Socket socket;

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
    socket.emit('message', text);
    _controller.text = "";
  }
}
