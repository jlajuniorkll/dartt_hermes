import 'package:dartt_hermes/pages/auth/controller/signin_controller.dart';
import 'package:get/instance_manager.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SigninController(), permanent: true);
  }
}
