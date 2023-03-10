import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../data/data.dart';

class DeckProvider extends ChangeNotifier {
  String _deckName = '';

  String get deckName => _deckName;

  void setDeckName(String value) {
    _deckName = value;
    notifyListeners();
  }

  Future<int> saveDeck() async {
    LocalDb localDb = LocalDb();
    DeckDao deckDao = DeckDao(localDb);

    var deckId = await deckDao.addDeck(_deckName);

    notifyListeners();
    return deckId;
  }
}
