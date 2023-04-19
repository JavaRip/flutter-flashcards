import 'package:drift/drift.dart';

class DeckTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 32)();
}

class CardTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get deckId => integer().references(DeckTable, #id)();
  TextColumn get front => text().withLength(min: 1, max: 512)();
  TextColumn get back => text().withLength(min: 1, max: 512)();
}

class ReviewTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cardId => integer().references(CardTable, #id)();
  DateTimeColumn get ts => dateTime()();
  BoolColumn get correct => boolean()();
}
