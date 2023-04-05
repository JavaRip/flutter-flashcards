import 'package:flutter/foundation.dart';
import '../../data/data.dart';

class NewDeckProvider extends ChangeNotifier {
  final DeckDao _deckDao;

  String _deckName = '';

  String get deckName => _deckName;

  NewDeckProvider({required DeckDao deckDao})
      : _deckDao = deckDao,
        super();

  void setDeckName(String value) {
    _deckName = value;
    notifyListeners();
  }

  Future<int> saveDeck() async {
    var deckId = await _deckDao.addDeck(_deckName);

    notifyListeners();
    return deckId;
  }
}
