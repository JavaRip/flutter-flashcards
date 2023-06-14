import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../../data/db.dart';
import '../../../di.dart';
import '../../../models/deck.dart';
import '../../../models/deck_card.dart';
import 'review_provider.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key, required this.deck});

  final Deck deck;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Deck Page: ${deck.name}')),
      body: ChangeNotifierProvider(
        create: (context) => ReviewProvider(
          deck: deck,
          cardDao: locator()
        ),
        child: Consumer<ReviewProvider>(builder: (context, reviewProvider, _) {
          return FutureBuilder<List<DeckCard>>(
            future: reviewProvider.loadCards(deck),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final card = reviewProvider.getCards()[reviewProvider.currentCardIndex];
                return _CreatePageBody(card: card);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            },
          );
        }),
      ),
    );
  }
}

class _CreatePageBody extends StatelessWidget {
  final DeckCard card;
  const _CreatePageBody({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lastIndex = Provider.of<ReviewProvider>(context, listen: false).cards.length - 1;
    final cardIndex = Provider.of<ReviewProvider>(context, listen: false).currentCardIndex;
    final end = Provider.of<ReviewProvider>(context, listen: false).end;

    if (!end) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Card ${cardIndex + 1} of ${lastIndex + 1}'),
            SizedBox(height: 5),
            Text(card.front),
            SizedBox(height: 5),
            Text(card.back),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<ReviewProvider>(context, listen: false).nextCard(); 
              },
              child: Text('Next Card'),
            ),
          ],
        ),
      );
    } else {
      return Column(
        children: [
          Center(child: Text('No more cards!')),
        ],
      );
    }
  }
}