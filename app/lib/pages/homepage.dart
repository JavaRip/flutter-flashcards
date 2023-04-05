import 'package:auto_route/auto_route.dart';
import 'package:flashcards/di.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homepage_provider.dart';
import '../router.gr.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Decks')),
      body: ChangeNotifierProvider(
        create: (context) => HomepageProvider(
          deckDao: locator(),
        ),
        child: Consumer<HomepageProvider>(
          builder: (context, homepageProvider, _) =>
              FutureBuilder<List<String>>(
            future: homepageProvider.setDeckTitles(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _CreatePageBody();
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}

class _CreatePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: Provider.of<HomepageProvider>(context, listen: false)
            .deckTitlesString
            .length,
        itemBuilder: (BuildContext context, int index) {
          final deck = Provider.of<HomepageProvider>(context, listen: false)
              .deckTitlesData[index];
          return InkWell(
            onTap: () => context.router.push(DeckRoute(deck: deck)),
            child: Container(
              height: 50,
              color: Colors.blue,
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                    Provider.of<HomepageProvider>(context, listen: false)
                        .deckTitlesData[index]
                        .name),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.router.push(const NewdeckRoute()),
        label: const Text('New Deck'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
