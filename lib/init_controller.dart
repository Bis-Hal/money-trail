import 'package:get/get.dart';
import 'package:money_trail/screens/main_controller.dart';

class InitController extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }

}