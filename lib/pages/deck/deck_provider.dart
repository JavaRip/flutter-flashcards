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
    notifyListeners();
    // First, create a LocalDb object
    LocalDb localDb = LocalDb();

    // Then, create a DeckDao object with the LocalDb object as an argument
    DeckDao deckDao = DeckDao(localDb);

    // Call the addDeck function on the DeckDao object with a name parameter
    return await deckDao.addDeck("MyNewDeck");
  }
}
