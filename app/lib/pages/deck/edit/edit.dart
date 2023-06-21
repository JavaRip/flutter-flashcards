import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../../data/db.dart';
import '../../../di.dart';
import '../../../models/deck.dart';
import '../../../models/deck_card.dart';
import 'edit_provider.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key, required this.deck}) : super(key: key);

  final Deck deck;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Deck Page: ${deck.name}')),
      body: ChangeNotifierProvider<EditProvider>(
        create: (context) => EditProvider(
          deck: deck,
          cardDao: locator(),
        ),
        child: Consumer<EditProvider>(
          builder: (context, editProvider, _) {
            return FutureBuilder<List<DeckCard>>(
              future: editProvider.loadCards(deck),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else if (snapshot.connectionState == ConnectionState.done) {
                  // return widget after Future completes
                  return _CreatePageBody(cards: snapshot.data!);
                } else {
                  // return some fallback widget
                  return const SizedBox.shrink();
                }
              },
            );
          },
        ),
      ),
    );
  }
}

class _CreatePageBody extends StatefulWidget {
  final List<DeckCard> cards;

  const _CreatePageBody({
    Key? key, 
    required this.cards,
  }) : super(key: key);

  @override
  _CreatePageBodyState createState() => _CreatePageBodyState();
}

class _CreatePageBodyState extends State<_CreatePageBody> {
  late List<TextEditingController> frontControllers;
  late List<TextEditingController> backControllers;

  @override
  void initState() {
    super.initState();

    frontControllers = widget.cards.map((card) => TextEditingController(text: card.front)).toList();
    backControllers = widget.cards.map((card) => TextEditingController(text: card.back)).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cards.isNotEmpty) {
      return ListView.builder(
        itemCount: widget.cards.length,
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

                  Provider.of<EditProvider>(context, listen: false).saveChange(widget.cards[index].id, newFront, newBack); 
                  print('Save button pressed for card at index ${widget.cards[index].id}');
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
