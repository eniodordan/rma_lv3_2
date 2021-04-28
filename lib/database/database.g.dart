// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  InspiringPersonDao? _inspiringPersonDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
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
            'CREATE TABLE IF NOT EXISTS `InspiringPerson` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `description` TEXT NOT NULL, `birth_date` INTEGER NOT NULL, `death_date` INTEGER NOT NULL, `quote1` TEXT NOT NULL, `quote2` TEXT NOT NULL, `quote3` TEXT NOT NULL, `image_url` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  InspiringPersonDao get inspiringPersonDao {
    return _inspiringPersonDaoInstance ??=
        _$InspiringPersonDao(database, changeListener);
  }
}

class _$InspiringPersonDao extends InspiringPersonDao {
  _$InspiringPersonDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _inspiringPersonInsertionAdapter = InsertionAdapter(
            database,
            'InspiringPerson',
            (InspiringPerson item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'birth_date': _dateTimeConverter.encode(item.birthDate),
                  'death_date': _dateTimeConverter.encode(item.deathDate),
                  'quote1': item.quote1,
                  'quote2': item.quote2,
                  'quote3': item.quote3,
                  'image_url': item.imageUrl
                },
            changeListener),
        _inspiringPersonUpdateAdapter = UpdateAdapter(
            database,
            'InspiringPerson',
            ['id'],
            (InspiringPerson item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'birth_date': _dateTimeConverter.encode(item.birthDate),
                  'death_date': _dateTimeConverter.encode(item.deathDate),
                  'quote1': item.quote1,
                  'quote2': item.quote2,
                  'quote3': item.quote3,
                  'image_url': item.imageUrl
                },
            changeListener),
        _inspiringPersonDeletionAdapter = DeletionAdapter(
            database,
            'InspiringPerson',
            ['id'],
            (InspiringPerson item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'birth_date': _dateTimeConverter.encode(item.birthDate),
                  'death_date': _dateTimeConverter.encode(item.deathDate),
                  'quote1': item.quote1,
                  'quote2': item.quote2,
                  'quote3': item.quote3,
                  'image_url': item.imageUrl
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<InspiringPerson> _inspiringPersonInsertionAdapter;

  final UpdateAdapter<InspiringPerson> _inspiringPersonUpdateAdapter;

  final DeletionAdapter<InspiringPerson> _inspiringPersonDeletionAdapter;

  @override
  Stream<List<InspiringPerson>> getAllPersons() {
    return _queryAdapter.queryListStream('SELECT * FROM InspiringPerson',
        mapper: (Map<String, Object?> row) => InspiringPerson(
            id: row['id'] as int?,
            name: row['name'] as String,
            description: row['description'] as String,
            birthDate: _dateTimeConverter.decode(row['birth_date'] as int),
            deathDate: _dateTimeConverter.decode(row['death_date'] as int),
            quote1: row['quote1'] as String,
            quote2: row['quote2'] as String,
            quote3: row['quote3'] as String,
            imageUrl: row['image_url'] as String),
        queryableName: 'InspiringPerson',
        isView: false);
  }

  @override
  Future<void> addPerson(InspiringPerson inspiringPerson) async {
    await _inspiringPersonInsertionAdapter.insert(
        inspiringPerson, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatePerson(InspiringPerson inspiringPerson) async {
    await _inspiringPersonUpdateAdapter.update(
        inspiringPerson, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletePerson(InspiringPerson inspiringPerson) async {
    await _inspiringPersonDeletionAdapter.delete(inspiringPerson);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
