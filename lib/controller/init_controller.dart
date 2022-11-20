import 'package:chat/controller/tap_controller.dart';
import 'package:get/instance_manager.dart';

// class InitDep extends Bindings {
//   @override
//   void dependencies() {
//     // TODO: implement dependencies
//     Get.lazyPut(() => TapController());
//   }
// }

Future<void> init() async {
  Get.lazyPut(() => TapController());
}
