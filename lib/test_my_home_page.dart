import 'package:chat/controller/tap_controller.dart';
import 'package:chat/page/test_first_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestMyHomePage extends StatelessWidget {
  const TestMyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 这一步是用来完成controller的装配和初始化
    TapController tapController = Get.find();
    return Scaffold(
      body: Container(
        // 这样可以占据整个页面
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 这里是固定的写法，GetBuilder接收一个泛型Controller
            GetBuilder<TapController>(
              // 这里是视图构建的时候需要传入的controller实例
              builder: (tapController) {
                return Container(
                  height: 100,
                  width: double.maxFinite,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Center(child: Text(tapController.x.toString())),
                );
              },
            ),
            GestureDetector(
              onTap: () {
                // 完成状态的更新
                tapController.increaseX();
              },
              child: Container(
                height: 100,
                width: double.maxFinite,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(child: Text("tap")),
              ),
            ),
            GestureDetector(
              onTap: () {
                // 完成状态的更新
                Get.to(() => TestFirstPage());
              },
              child: Container(
                height: 100,
                width: double.maxFinite,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(child: Text("first page")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
