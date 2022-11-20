import 'package:chat/controller/tap_controller.dart';
import 'package:chat/page/test_second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

class TestFirstPage extends StatelessWidget {
  const TestFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    TapController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
            )),
      ),
      body: Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GetBuilder<TapController>(
                init: TapController(),
                initState: (_) {},
                builder: (_) {
                  return Container(
                    height: 100,
                    margin: EdgeInsets.all(10),
                    child: Center(child: Text(controller.x.toString())),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  );
                },
              ),
              GestureDetector(
                onTap: () {
                  controller.decreaseX();
                },
                child: Container(
                  height: 100,
                  margin: EdgeInsets.all(10),
                  child: Center(child: Text("decrease")),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => TestSecondPage());
                },
                child: Container(
                  height: 100,
                  width: double.maxFinite,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Center(child: Text("go second page")),
                ),
              ),
            ],
          )),
    );
  }
}
