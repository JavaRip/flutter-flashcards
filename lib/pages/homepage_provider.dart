import 'package:flutter/foundation.dart';

import '../data/dao/deck_dao.dart';
import '../data/db.dart';

class HomepageProvider extends ChangeNotifier {
  final DeckDao _deckDao;

  List<DeckData> _deckTitlesData = [];
  List<String> _deckTitlesString = [];

  List<DeckData> get deckTitlesData => _deckTitlesData;
  List<String> get deckTitlesString => _deckTitlesString;

  HomepageProvider({required DeckDao deckDao})
      : _deckDao = deckDao,
        super();

  Future<List<String>> setDeckTitles() async {
    _deckTitlesData = await _deckDao.getAllDecks();
    _deckTitlesString =
        _deckTitlesData.map((deckData) => deckData.name).toList();

    notifyListeners();
    return _deckTitlesString;
  }
}
