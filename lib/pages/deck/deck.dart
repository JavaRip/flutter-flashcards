import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'deck_provider.dart';

class DeckPage extends StatelessWidget {
  const DeckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nav Bar')),
      body: ChangeNotifierProvider(
        create: (context) => DeckProvider(),
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
            Provider.of<DeckProvider>(context, listen: false).setDeckName(text);
          },
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () async {
            await Provider.of<DeckProvider>(context, listen: false).saveDeck();
          },
          child: const Text('Create Card'),
        ),
        const Spacer(),
      ],
    );
  }
}
