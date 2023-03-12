import 'package:flutter/foundation.dart';

import '../data/dao/deck_dao.dart';
import '../data/db.dart';

class HomepageProvider extends ChangeNotifier {
  List<DeckData> _deckTitlesData = [];
  List<String> _deckTitlesString = [];

  List<DeckData> get deckTitlesData => _deckTitlesData;
  List<String> get deckTitlesString => _deckTitlesString;

  Future<List<String>> setDeckTitles() async {
    LocalDb localDb = LocalDb();
    DeckDao deckDao = DeckDao(localDb);

    _deckTitlesData = await deckDao.getAllDecks();
    _deckTitlesString =
        _deckTitlesData.map((deckData) => deckData.name).toList();

    print('--------------------------------');
    print(deckTitlesString);
    notifyListeners();
    return _deckTitlesString;
  }
}
