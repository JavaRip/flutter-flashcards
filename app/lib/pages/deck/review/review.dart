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
        child: _CreatePageBody(),
      ),
    );
  }
}

class _CreatePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('hello from review page');
  }
}