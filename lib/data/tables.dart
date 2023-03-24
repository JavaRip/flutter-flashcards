import 'package:drift/drift.dart';

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
