import 'package:money_trail/model/model_transaction.dart';

mixin FactoryController{
  ModelTransaction mapDocumentToModelTransaction(var document) {
    return ModelTransaction(
        title: document["title"],
        amount: document["amount"] ,
        extra01: document["extra01"],
        extra02: document["extra02"],
        extra03: document["extra03"],
        extra04: document["extra04"],
        extra05: document["extra05"],
        type: document["type"],
        date: document["date"]);
  }
}