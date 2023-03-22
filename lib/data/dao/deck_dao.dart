import 'package:drift/drift.dart';
import '../db.dart';
import '../tables.dart';

part 'deck_dao.g.dart';

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(tables: [Deck])
class DeckDao extends DatabaseAccessor<LocalDb> with _$DeckDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  DeckDao(LocalDb db) : super(db);

  Future<List<DeckData>> getAllDecks() => select(deck).get();
  Stream<List<DeckData>> watchAllDecks() => select(deck).watch();

  Future<int> addDeck(String name) {
    return into(deck).insert(DeckCompanion.insert(name: name));
  }
}
