import 'package:chat/controller/tap_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class TestSecondPage extends StatelessWidget {
  const TestSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    TapController controller = Get.find();
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(child: Text("x value " + controller.x.toString())),
            ),
            // 这种是针对obs类型的变量独有的语法
            Obx(() => Container(
                  margin: EdgeInsets.all(10),
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Center(
                      child: Text("y value " + controller.y.value.toString())),
                )),
            GestureDetector(
              onTap: () {
                controller.increaseY();
              },
              child: Container(
                margin: EdgeInsets.all(10),
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(color: Colors.blue),
                child: Center(child: Text("increase y")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
