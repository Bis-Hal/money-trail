import 'package:get/get.dart';
import 'package:money_trail/database/collections.dart';
import 'package:money_trail/model/model_transaction.dart';

import '../factory_controller/factoy_controller.dart';

class MainController extends GetxController with FactoryController {
  final RxInt _currentIndex = 0.obs;
  final RxBool _loggedIn = false.obs;
  RxList transactions = [].obs;


  bool get isLoggedIn => _loggedIn.value;

  setLoggedIn() {
    _loggedIn.value = !_loggedIn.value;
  }

  get currentIndex => _currentIndex.value;

  void setCurrentIndex(int index) {
    _currentIndex.value = index;
  }

  void onInit() {
    super.onInit();
    extractTransaction();
  }

  extractTransaction() async {
    transactions.clear();
    await FirebaseCollections("User1")
        .transactionCollection
        .snapshots()
        .forEach((document) {
      transactions.addAll(
          document.docs.map((e) =>
              ModelTransaction(
                  title: e["title"],
                  amount: e["amount"],
                  extra01: e["extra01"],
                  extra02: e["extra02"],
                  extra03: e["extra03"],
                  extra04: e["extra04"],
                  extra05: e["extra05"],
                  type: e["type"],
                  date: e["date"])));
    });

    await FirebaseCollections("User1")
        .transactionCollection
        .snapshots()
        .forEach((snapshots) {
      if (!transactions.contains(snapshots)) {
        transactions.addAll(
            snapshots.docs.map((document) =>
                mapDocumentToModelTransaction(document)));
      }
    });
  }
}


