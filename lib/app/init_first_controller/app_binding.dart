
import 'package:get/get.dart';

import 'init_first_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<InitFirstController>(InitFirstController(), permanent: true);
  }
}
