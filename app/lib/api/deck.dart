import 'package:flashcards/api/queries/get_all_decks.graphql.dart';
import 'package:flashcards/models/deck.dart';
import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeckApi {
  final GraphQLClient client;

  DeckApi({required this.client});

  Future<List<Deck>> fetchDecks() async {
    final response = await client.query$getAllDecks();

    if (response.parsedData != null) {
      return response.parsedData!.decks.map((deck) => Deck(id: deck.id, name: deck.name)).toList();
    } else {
      throw 'no data in decks';
    }
  }
}