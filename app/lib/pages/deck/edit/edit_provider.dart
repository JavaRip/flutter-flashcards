import 'package:flutter/foundation.dart';

import '../../../data/dao/card_dao.dart';
import '../../../data/dao/dao.dart';
import '../../../data/db.dart';
import '../../../models/deck.dart';
import '../../../models/deck_card.dart';

class EditProvider extends ChangeNotifier {
  final CardDao _cardDao;
  String _deckId;
  List<DeckCard> _cardsForDeck = [];

  EditProvider({required CardDao cardDao, required Deck deck})
      : _cardDao = cardDao,
        _deckId = deck.id,
        super();

  List<DeckCard> getCards() {
    return _cardsForDeck;
  }

  Future<bool> saveChange(String cardId, String newFront, String newBack) async {
    // DeckCard card = _cardsForDeck[int.parse(cardId)];
    print('cardId: $cardId');
    print('back: $newBack');
    print('front: $newFront');
    print('deckId: $_deckId');
    print('================================');
    return await _cardDao.updateCard(
      front: newFront,
      back: newBack,
      cardId: int.parse(cardId),
      deckId: int.parse(_deckId),
    );
  }

  Future<List<DeckCard>> loadCards(Deck deck) async {
    List<CardTableData> cardTableData = await _cardDao.getCardsByDeckId(deck.id);
    _cardsForDeck = cardTableData.map((data) => DeckCard(id: data.id.toString(), deckId: data.deckId.toString(), front: data.front, back: data.back)).toList();
    return _cardsForDeck;
  }
}
