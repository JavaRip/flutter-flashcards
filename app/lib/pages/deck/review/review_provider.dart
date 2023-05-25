import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../data/dao/card_dao.dart';
import '../../../data/dao/dao.dart';
import '../../../data/db.dart';
import '../../../models/deck.dart';
import '../../../models/deck_card.dart';

class ReviewProvider extends ChangeNotifier {
  final CardDao _cardDao;
  int currentCardIndex = 0;
  List<DeckCard> cards = [];
  bool end = false;

  ReviewProvider({required CardDao cardDao, required Deck deck})
      : _cardDao = cardDao,
        super();

  DeckCard getCurrentCard() {
    return cards[currentCardIndex];
  }

  void nextCard() {
    if (currentCardIndex < cards.length - 1) {
      currentCardIndex++;
    } else {
      end = true;
    }
    notifyListeners();
  }

  List<DeckCard> getCards() {
    return cards;
  }

  Future<List<DeckCard>> loadCards(Deck deck) async {
    List<CardTableData> cardTableData = await _cardDao.getCardsByDeckId(deck.id);
    cards = cardTableData.map((data) => DeckCard(id: data.id.toString(), deckId: data.deckId.toString(), front: data.front, back: data.back)).toList();
    return cards;
  }
}
