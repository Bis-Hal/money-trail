import 'package:floor/floor.dart';
import 'package:money_trail/database/local/transaction/transaction_entity.dart';

@dao
abstract class TransactionDAO{
  @Query("SELECT * FROM TransactionEntity")
  Future<List<TransactionEntity>> findAllTransaction();

  @insert
  Future<void> setTransaction(TransactionEntity transaction);



}