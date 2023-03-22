import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'db.g.dart';

class Deck extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 32)();
}

class Card extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get deckId => integer().references(Deck, #id)();
  TextColumn get front => text().withLength(min: 1, max: 512)();
  TextColumn get back => text().withLength(min: 1, max: 512)();
}

class Review extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cardId => integer().references(Card, #id)();
  DateTimeColumn get ts => dateTime()();
  BoolColumn get correct => boolean()();
}

// this annotation tells drift to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@DriftDatabase(tables: [Deck, Card, Review])
class LocalDb extends _$LocalDb {
  LocalDb() : super(_openConnection());
  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
