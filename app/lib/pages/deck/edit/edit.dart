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
                if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            );
            editProvider.setDeckId(int.parse(deck.id));

            List<DeckCard> cards = editProvider.getCards();
            List<TextEditingController> frontControllers = cards.map((card) => TextEditingController(text: card.front)).toList();
            List<TextEditingController> backControllers = cards.map((card) => TextEditingController(text: card.back)).toList();

            return _CreatePageBody(cards: cards, frontControllers: frontControllers, backControllers: backControllers);
          },
        ),
      ),
    );
  }
}

class _CreatePageBody extends StatelessWidget {
  final List<DeckCard> cards;
  final List<TextEditingController> frontControllers;
  final List<TextEditingController> backControllers;

  const _CreatePageBody({
    Key? key, 
    required this.cards, 
    required this.frontControllers, 
    required this.backControllers
  }) : super(key: key);

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
                  controller: frontControllers[index],
                  onChanged: (value) {
                    print('update the front value of the corresponding DeckCard');
                  },
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: backControllers[index],
                  onChanged: (value) {
                    print('update the back value of the corresponding DeckCard');
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  String newFront = frontControllers[index].text;
                  String newBack = backControllers[index].text;

                  // Provider.of<EditProvider>(context, listen: false).saveChange(cards[index].id, newFront, newBack); 
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