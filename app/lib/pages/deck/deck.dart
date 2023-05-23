import 'package:auto_route/auto_route.dart';
import 'package:flashcards/models/deck.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/db.dart';
import '../../../router.gr.dart';
import 'review_provider.dart';

class DeckPage extends StatelessWidget {
  const DeckPage({super.key, required this.deck});

  final Deck deck;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Deck Page: ${deck.name}')),
      body: ChangeNotifierProvider(
        create: (context) => ReviewProvider(),
        child: _CreatePageBody(deck: deck),
      ),
    );
  }
}

class _CreatePageBody extends StatelessWidget {
  final Deck deck;

  const _CreatePageBody({Key? key, required this.deck}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ([
        ElevatedButton(
          onPressed: () {
            context.router.push(ReviewRoute(deck: deck));
          },
          child: const Text('Review Cards'),
        ),
        ElevatedButton(
          onPressed: () {
            context.router.push(EditRoute(deck: deck));
          },
          child: const Text('Edit Cards'),
        ),
        ElevatedButton(
          onPressed: () {
            context.router.push(AddRoute(deck: deck));
          },
          child: const Text('Add Cards'),
        ),
      ]),
    );
  }
}