import 'package:crowd_buying/src/controller/bottom_nav_controller.dart';
import 'package:crowd_buying/src/controller/home_controller.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
    // Get.put(AuthController(), permanent: true);
  }

  static additionalBinding() {
    Get.put(HomeController(), permanent: true);
    // Get.put(MypageController(), permanent: true);
  }
}
