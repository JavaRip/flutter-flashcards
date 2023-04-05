import 'package:flashcards/di.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'new_deck_provider.dart';

class NewdeckPage extends StatelessWidget {
  const NewdeckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Deck')),
      body: ChangeNotifierProvider(
        create: (context) => NewDeckProvider(deckDao: locator()),
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
      children: [
        const Spacer(),
        TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Deck name',
          ),
          onChanged: (text) {
            Provider.of<NewDeckProvider>(context, listen: false)
                .setDeckName(text);
          },
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () async {
            await Provider.of<NewDeckProvider>(context, listen: false)
                .saveDeck();
          },
          child: const Text('Create Deck'),
        ),
        const Spacer(),
      ],
    );
  }
}
