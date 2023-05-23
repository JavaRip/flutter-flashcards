import 'package:flutter/foundation.dart';

import '../../../data/dao/card_dao.dart';
import '../../../data/dao/dao.dart';
import '../../../data/db.dart';
import '../../../models/deck.dart';
import '../../../models/deck_card.dart';

class ReviewProvider extends ChangeNotifier {
  final CardDao _cardDao;

  List<DeckCard> _cardsForDeck = [];

  ReviewProvider({required CardDao cardDao, required Deck deck})
      : _cardDao = cardDao,
        super();

  void helloWorld() {
    print('hello world');
  }
}
