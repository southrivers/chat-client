import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xffF5F5F5),
          image: DecorationImage(
            image: AssetImage('images/login/login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 160),
                child: Text(
                  "话聊",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 15),
                ),
              ),
              const TextField(
                keyboardType: TextInputType.phone,
                // controller: TextEditingController.,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  labelText: "用户",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  suffixIcon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                autofocus: true,
              ),
              const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "密码",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  suffixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                ),
                obscureText: true,
              ),
              Gap(18),
              InkWell(
                onTap: () {
                  print("forget passwd");
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "忘记密码",
                    style: TextStyle(color: Color(0xffA1BFD5)),
                  ),
                ),
              ),
              Gap(90),
              InkWell(
                onTap: () => {print("object")},
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff709ABB),
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 140, vertical: 12),
                    child: Text(
                      "登录",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        letterSpacing: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Gap(50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "还没有账号?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Gap(6),
                  InkWell(
                    onTap: () {
                      print("zhuce");
                    },
                    child: Text(
                      "注册",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff7CA4C2),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
