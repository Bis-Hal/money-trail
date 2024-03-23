// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorTransactionDataBase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$TransactionDataBaseBuilder databaseBuilder(String name) =>
      _$TransactionDataBaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$TransactionDataBaseBuilder inMemoryDatabaseBuilder() =>
      _$TransactionDataBaseBuilder(null);
}

class _$TransactionDataBaseBuilder {
  _$TransactionDataBaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$TransactionDataBaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$TransactionDataBaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<TransactionDataBase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$TransactionDataBase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$TransactionDataBase extends TransactionDataBase {
  _$TransactionDataBase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TransactionDAO? _transactionDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TransactionEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `category` INTEGER NOT NULL, `type` TEXT NOT NULL, `remarks` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TransactionDAO get transactionDAO {
    return _transactionDAOInstance ??=
        _$TransactionDAO(database, changeListener);
  }
}

class _$TransactionDAO extends TransactionDAO {
  _$TransactionDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _transactionEntityInsertionAdapter = InsertionAdapter(
            database,
            'TransactionEntity',
            (TransactionEntity item) => <String, Object?>{
                  'id': item.id,
                  'category': item.category,
                  'type': item.type,
                  'remarks': item.remarks
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TransactionEntity> _transactionEntityInsertionAdapter;

  @override
  Future<List<TransactionEntity>> findAllTransaction() async {
    return _queryAdapter.queryList('SELECT * FROM TransactionEntity',
        mapper: (Map<String, Object?> row) => TransactionEntity(
            id: row['id'] as int,
            category: row['category'] as int,
            type: row['type'] as String,
            remarks: row['remarks'] as String));
  }

  @override
  Future<void> setTransaction(TransactionEntity transaction) async {
    await _transactionEntityInsertionAdapter.insert(
        transaction, OnConflictStrategy.abort);
  }
}
