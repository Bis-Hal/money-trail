import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_trail/database/firebase_config.dart';

class FirebaseCollections {
  FirebaseFirestore instance = FirebaseFirestore.instance;
  late CollectionReference _entryPointCollection;
  late CollectionReference _transactionCollection;
  String user;

  CollectionReference get entryPointCollection => _entryPointCollection;
  CollectionReference get transactionCollection => _transactionCollection;

  FirebaseCollections(this.user) {
    this.user = "Bishal";
    init();
  }

  init() {
    _entryPointCollection = Firebase.instance.collection("Bishal");
    print(_entryPointCollection.path);
    _transactionCollection = _entryPointCollection
        .doc("BD7CpyeHFcvEubpsH8xL")
        .collection("Transactions");
    print(_entryPointCollection.path.isEmpty);

  }


}
