import 'package:floor/floor.dart';


@entity
class TransactionEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final int category;
  final String type;
  final String remarks;

  TransactionEntity({this.id,required this.category, required this.type, required this.remarks});

  @override
  String toString() {
    return "id: $id category: $category type: $type  remarks: $remarks";
  }
}
