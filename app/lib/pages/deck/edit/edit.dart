import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../../data/db.dart';
import '../../../di.dart';
import '../../../models/deck.dart';
import '../../../models/deck_card.dart';
import 'edit_provider.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key, required this.deck});

  final Deck deck;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Deck Page: ${deck.name}')),
      body: ChangeNotifierProvider(
        create: (context) => EditProvider(
          deck: deck,
          cardDao: locator()
        ),
        child: Consumer<EditProvider>(
          builder: (context, editProvider, _) {
            FutureBuilder<List<DeckCard>>(
              future: editProvider.loadCards(deck),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _CreatePageBody(cards: snapshot.data!);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            );
            return _CreatePageBody(cards: editProvider.getCards());
          },
        ),
      ),
    );
  }
}

class _CreatePageBody extends StatelessWidget {
  final List<DeckCard> cards;

  const _CreatePageBody({Key? key, required this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (cards.isNotEmpty) {
      return ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: cards[index].front,
                  onChanged: (value) {
                    print('update the front value of the corresponding DeckCard');
                  },
                ),
              ),
              Expanded(
                child: TextFormField(
                  initialValue: cards[index].back,
                  onChanged: (value) {
                    print('update the back value of the corresponding DeckCard');
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  print('Save button pressed for card at index ${cards[index].id}');
                  // Add your save logic here
                },
                icon: Icon(Icons.save),
              ),
            ],
          );
        },
      );
    } else {
      return Text('No items to display');
    }
  }
}