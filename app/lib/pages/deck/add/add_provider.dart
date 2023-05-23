import 'package:flutter/foundation.dart';

import '../../../data/dao/card_dao.dart';
import '../../../data/dao/dao.dart';
import '../../../data/db.dart';
import '../../../models/deck.dart';
import '../../../models/deck_card.dart';

class AddProvider extends ChangeNotifier {
  final CardDao _cardDao;
  final Deck _deck;
  String _front = '';
  String _back = '';

  AddProvider({required CardDao cardDao, required Deck deck})
      : _cardDao = cardDao,
      _deck = deck,
        super();

  void setFront(String front) {
    _front = front;
    notifyListeners();
  }

  void setBack(String back) {
    _back = back;
    notifyListeners();
  }

  Future<int> saveCard() async {
    var cardId = await _cardDao.addCard(front: _front, back: _back, deckId: int.parse(_deck.id));

    notifyListeners();
    return cardId;
  }
}
