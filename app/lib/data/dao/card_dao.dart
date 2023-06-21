import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../../models/deck_card.dart';
import '../db.dart';
import '../tables.dart';

part 'card_dao.g.dart';

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(tables: [DeckTable, CardTable])
@injectable
class CardDao extends DatabaseAccessor<LocalDb> with _$CardDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  CardDao(LocalDb db) : super(db);

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

  Future<bool> updateCard({
    required String front,
    required String back,
    required int deckId,
    required int cardId,
  }) {
    return update(cardTable).replace(
      CardTableData(
        id: cardId,
        back: back,
        front: front,
        deckId: deckId,
      ),
    );
  }

  Future<List<CardTableData>> getCardsByDeckId(String deckId) =>
    (select(cardTable)..where((table) => table.deckId.equals(int.parse(deckId)))).get();
}
