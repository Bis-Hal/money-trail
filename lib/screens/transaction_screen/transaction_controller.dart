import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_trail/database/collections.dart';
import 'package:money_trail/factory_controller/factoy_controller.dart';
import 'package:money_trail/model/model_transaction.dart';

class TransactionController extends GetxController with FactoryController{
  final RxMap<String, List<ModelTransaction>> _transactionsByDates =  <String, List<ModelTransaction>>{}.obs;

  Map<String, List<ModelTransaction>> get transactionsByDates => _transactionsByDates;

  Future<void> setTransactionsByDates() async {
    await FirebaseCollections("User1")
        .transactionCollection
        .snapshots()
        .forEach((snapshots) {
          for (var document in snapshots.docs) {
            var key = DateFormat("dd MMM, yyy").format(DateTime.parse(document["date"]));
            if(!_transactionsByDates.containsKey(key)){
              List<ModelTransaction> modelTransactions = [];
              modelTransactions.add(mapDocumentToModelTransaction(document));
              _transactionsByDates.putIfAbsent(key, () => modelTransactions);
            }
            _transactionsByDates[key]!.add(mapDocumentToModelTransaction(document));
          }
    });
  }
}
