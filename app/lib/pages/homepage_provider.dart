import 'package:flutter/foundation.dart';
import '../data/dao/deck_dao.dart';
import '../data/db.dart';
import '../models/deck.dart';

class HomepageProvider extends ChangeNotifier {
  final DeckDao _deckDao;

  List<Deck> _deckTitlesData = [];
  List<String> _deckTitlesString = [];

  List<Deck> get deckTitlesData => _deckTitlesData;
  List<String> get deckTitlesString => _deckTitlesString;

  HomepageProvider({required DeckDao deckDao})
      : _deckDao = deckDao,
        super();

  Future<List<String>> setDeckTitles() async {
    List<DeckTableData> deckTableData = await _deckDao.getAllDecks();
    _deckTitlesData = deckTableData.map((data) => Deck(id: data.id.toString(), name: data.name)).toList();
    _deckTitlesString = _deckTitlesData.map((deck) => deck.name).toList();

    notifyListeners();
    return _deckTitlesString;
  }
}