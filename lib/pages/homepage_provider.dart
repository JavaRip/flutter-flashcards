import 'package:flutter/foundation.dart';

import '../data/dao/deck_dao.dart';
import '../data/db.dart';

class HomepageProvider extends ChangeNotifier {
  List<DeckData> _deckTitles = [];

  List<DeckData> get deckTitles => _deckTitles;

  Future<void> setDeckTitles() async {
    LocalDb localDb = LocalDb();
    DeckDao deckDao = DeckDao(localDb);

    _deckTitles = await deckDao.getAllDecks();
    notifyListeners();
  }
}
