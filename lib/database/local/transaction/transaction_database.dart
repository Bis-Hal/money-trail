import 'package:floor/floor.dart';
import 'package:money_trail/database/local/transaction/transaction_dao.dart';
import 'package:money_trail/database/local/transaction/transaction_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'transaction_database.g.dart';
@Database(version: 1, entities: [TransactionEntity])
abstract class TransactionDataBase extends FloorDatabase{
  TransactionDAO get transactionDAO;

}