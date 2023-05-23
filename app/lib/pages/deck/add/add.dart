import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../../data/db.dart';
import '../../../di.dart';
import '../../../models/deck.dart';
import 'add_provider.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key, required this.deck});

  final Deck deck;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Deck Page: ${deck.name}')),
      body: ChangeNotifierProvider(
        create: (context) => AddProvider(
          deck: deck,
          cardDao: locator()
        ),
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
            hintText: 'Front',
          ),
          onChanged: (text) {
            Provider.of<AddProvider>(context, listen: false)
                .setFront(text);
          },
        ),
        const Spacer(),
        TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Back',
          ),
          onChanged: (text) {
            Provider.of<AddProvider>(context, listen: false)
                .setBack(text);
          },
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () async {
            await Provider.of<AddProvider>(context, listen: false)
                .saveCard();
          },
          child: const Text('Add Card'),
        ),
        const Spacer(),
      ],
    );
  }
}
