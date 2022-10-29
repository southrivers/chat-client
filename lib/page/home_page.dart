import 'package:chat/page/chat_page.dart';
import 'package:chat/page/contract_page.dart';
import 'package:chat/page/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Color(0xff709ABB),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(Icons.search_rounded),
            ),
          ],
          // TODO 根据页面进行切换
          title: Text("聊天窗"),
        ),
        // 根据页面选择进行切换
        body: ProfilePage(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined),
              label: "聊天窗",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined),
              label: "联系人",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_add_alt_rounded),
              label: "我",
            ),
          ],
          onTap: (value) {
            print(value);
          },
          // TODO 根据选择的页面切换下标
          currentIndex: 2,
        ));
  }
}
