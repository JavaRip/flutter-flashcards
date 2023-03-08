import 'package:drift/drift.dart';
import '../db.dart';

part 'card_dao.g.dart';

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(tables: [Deck, Card])
class CardsDao extends DatabaseAccessor<LocalDb> with _$CardsDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  CardsDao(LocalDb db) : super(db);

  Future<List<CardData>> getAllCards() => select(card).get();
  Stream<List<CardData>> watchAllCards() => select(card).watch();

  Future<int> addCard({
    required String front,
    required String back,
    required int deckId,
  }) {
    return into(card).insert(
      CardCompanion.insert(
        back: back,
        front: front,
        deckId: deckId,
      ),
    );
  }
}
