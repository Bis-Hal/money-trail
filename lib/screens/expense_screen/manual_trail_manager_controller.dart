import 'package:get/get.dart';
import 'package:money_trail/database/collections.dart';
import 'package:money_trail/model/model_transaction.dart';
import 'package:money_trail/screens/home_screen/widgets/transaction.dart';

class ManualTrailManagerController {
  final RxInt _infiniteCarouselIndex = 0.obs;

  String title = "NULL";
  String type = "NULL";
  String extra01 = "0";
  String extra02 = "0";
  String extra03 = "0";
  String extra04 = "0";
  String extra05 = "0";
  int id = 1;


   int get infiniteCarouselIndex => _infiniteCarouselIndex.value;

  set infiniteCarouselIndex(int value) {
    _infiniteCarouselIndex.value = value;
  }

  ModelTransaction transaction = ModelTransaction.nonParameterized();

  void setTransaction() async {
    print(transaction.amount);
    await FirebaseCollections("User1")
        .transactionCollection
        .doc(DateTime.now().toIso8601String())
        .set({
      "title": "Test250",
      "type": type,
      "date": DateTime.now().toIso8601String(),
      "amount": transaction.amount,
      "extra01": extra01,
      "extra02": extra02,
      "extra03": extra03,
      "extra04": extra04,
      "extra05": extra05,
    });
  }
}
