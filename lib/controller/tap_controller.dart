import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class TapController extends GetxController {
  int _x = 0;

  // 这里的get是一个关键字，表示我们可以通过x获取_x的数据
  int get x => _x;

  // 这种命名方式表示其是私有的变量，无法从外部被访问
  RxInt _y = 0.obs;
  RxInt get y => _y;

  void increaseY() {
    _y.value++;
  }

  void decreaseY() {
    _y.value--;
  }

  void increaseX() {
    _x++;
    // 这一步是必须要的，其类似于一个发出通知，getbuilder类似于一个listener，
    // 只有这样getbuilder才会接到通知，进而触发视图的更新
    update();
    print(_x);
  }

  void decreaseX() {
    _x--;
    // 这一步是必须要的，其类似于一个发出通知，getbuilder类似于一个listener，
    // 只有这样getbuilder才会接到通知，进而触发视图的更新
    update();
    print(_x);
  }
}
