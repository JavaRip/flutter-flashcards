import 'package:flutter/material.dart';
import '../data/data.dart';
import 'homepage_provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Decks')),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 8, // number of decks
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber,
            child: const Center(child: Text('hello world')),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {Navigator.of(context).pushNamed('/deck')},
        label: const Text('New Deck'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
