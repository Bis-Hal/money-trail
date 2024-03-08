import 'package:get/get.dart';
import 'package:googleapis/shared.dart';

class SignInController extends GetxController{
  final RxBool _isObstruct = true.obs;

  bool get isObstruct => _isObstruct.value;

  void setObstruct({bool? state}) {
    if(state != null){
      _isObstruct.value = state;
      return;
    }
    _isObstruct.value = !_isObstruct.value;
  }
}