import 'package:flutter/foundation.dart';

import '../../../data/dao/card_dao.dart';
import '../../../data/dao/dao.dart';
import '../../../data/db.dart';
import '../../../models/deck.dart';
import '../../../models/deck_card.dart';

class EditProvider extends ChangeNotifier {
  final CardDao _cardDao;

  List<DeckCard> _cardsForDeck = [];

  EditProvider({required CardDao cardDao, required Deck deck})
      : _cardDao = cardDao,
        super();

  void helloWorld() {
    print('hello world');
    print(_cardsForDeck);
    print(_cardsForDeck[0]);
  }

  List<DeckCard> getCards() {
    return _cardsForDeck;
  }

  Future<List<DeckCard>> loadCards(Deck deck) async {
    List<CardTableData> cardTableData = await _cardDao.getCardsByDeckId(deck.id);
    _cardsForDeck = cardTableData.map((data) => DeckCard(id: data.id.toString(), deckId: data.deckId.toString(), front: data.front, back: data.back)).toList();
    notifyListeners();
    return _cardsForDeck;
  }
}
