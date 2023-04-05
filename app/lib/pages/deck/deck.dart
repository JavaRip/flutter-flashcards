import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/db.dart';
import 'deck_provider.dart';

class DeckPage extends StatelessWidget {
  const DeckPage({super.key, required this.deck});

  final DeckData deck;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Deck Page: ${deck.name}')),
      body: ChangeNotifierProvider(
        create: (context) => ReviewProvider(),
        child: _CreatePageBody(),
      ),
    );
  }
}

class _CreatePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ([
        ElevatedButton(
          onPressed: () {
            Provider.of<ReviewProvider>(context, listen: false).helloWorld();
          },
          child: const Text('Review Cards'),
        ),
        ElevatedButton(
          onPressed: () {
            Provider.of<ReviewProvider>(context, listen: false).helloWorld();
          },
          child: const Text('Edit Cards'),
        ),
      ]),
    );
  }
}
