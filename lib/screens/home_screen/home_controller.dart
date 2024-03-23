import 'package:get/get.dart';

class HomeController{
  final Rx<bool> _isBalanceVisible = false.obs;

  bool get isBalanceVisible => _isBalanceVisible.value;

  setBalanceVisibility() {
    _isBalanceVisible.value = !_isBalanceVisible.value;
  }


}