import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQFliteRepository {
  SQFliteRepository._();

  static final SQFliteRepository instance = SQFliteRepository._();

  static Database? _database;

  get database async {
    if (_database != null) return _database;
    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'japa_mala_6.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, version) async {
    await db.execute(_pratices1);
    await db.execute(_pratices2);
    for (var i in _initialValues) {
      await db.execute(i);
    }
  }

  String get _pratices1 => '''
CREATE table Meditation(
id INTEGER PRIMARY KEY,
name TEXT NOT NULL,
  hrs INTEGER,
  minutes INTEGER,
  seconds INTEGER
);
''';
  String get _pratices2 => '''
CREATE table Mantra(
id INTEGER PRIMARY KEY,
 name TEXT NOT NULL,
  description TEXT,
  acumulation INTEGER,
  goal INTEGER

);
''';

  List<String> get _initialValues => [
        "insert into Meditation (name,hrs,minutes,seconds) values('Meditation 1',0,30,0);",
        "insert into Mantra (name,description,acumulation,goal) values('Mantra 1','some mantra','100',10000);",
      ];
}
