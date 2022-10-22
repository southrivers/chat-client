import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendBar extends StatelessWidget {
  const SendBar({
    Key? key,
    required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

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
              icon: Icon(
                Icons.send_rounded,
              ),
              onPressed: () {
                print(_controller.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
