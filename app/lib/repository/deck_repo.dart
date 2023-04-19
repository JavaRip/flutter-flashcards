import 'package:flashcards/api/deck.dart';
import 'package:flashcards/data/dao/deck_dao.dart';
import 'package:injectable/injectable.dart';

import '../models/deck.dart';

@injectable
class DeckRepo {
  final DeckApi _api;
  final DeckDao _dao;

  DeckRepo({required DeckApi api, required DeckDao dao}): _api = api, _dao = dao;

  Future<List<Deck>> getAllDecks() async {
    return _api.fetchDecks();
  }
}