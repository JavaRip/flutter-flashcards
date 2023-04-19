import 'package:drift/drift.dart';
import '../db.dart';
import '../tables.dart';

part 'card_dao.g.dart';

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(tables: [DeckTable, CardTable])
class CardsDao extends DatabaseAccessor<LocalDb> with _$CardsDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  CardsDao(LocalDb db) : super(db);

  Future<List<CardTableData>> getAllCards() => select(cardTable).get();
  Stream<List<CardTableData>> watchAllCards() => select(cardTable).watch();

  Future<int> addCard({
    required String front,
    required String back,
    required int deckId,
  }) {
    return into(cardTable).insert(
      CardTableCompanion.insert(
        back: back,
        front: front,
        deckId: deckId,
      ),
    );
  }
}
