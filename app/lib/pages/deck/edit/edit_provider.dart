import 'package:flutter/foundation.dart';

import '../../../data/dao/card_dao.dart';
import '../../../data/dao/dao.dart';
import '../../../data/db.dart';
import '../../../models/deck.dart';
import '../../../models/deck_card.dart';

class EditProvider extends ChangeNotifier {
  final CardDao _cardDao;
  int _deckId = 0;
  List<DeckCard> _cardsForDeck = [];

  EditProvider({required CardDao cardDao, required Deck deck})
      : _cardDao = cardDao,
        super();

  void setDeckId(int id) {
    _deckId = id;
  }

  List<DeckCard> getCards() {
    return _cardsForDeck;
  }

  Future<bool> saveChange(String cardId, String newFront, String newBack) async {
    DeckCard card = _cardsForDeck[int.parse(cardId)];
    return await _cardDao.updateCard(
      front: newFront,
      back: newBack,
      cardId: int.parse(cardId),
      deckId: _deckId,
    );
  }

  Future<List<DeckCard>> loadCards(Deck deck) async {
    List<CardTableData> cardTableData = await _cardDao.getCardsByDeckId(deck.id);
    _cardsForDeck = cardTableData.map((data) => DeckCard(id: data.id.toString(), deckId: data.deckId.toString(), front: data.front, back: data.back)).toList();
    return _cardsForDeck;
  }
}
