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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: Provider.of<HomepageProvider>(context, listen: false)
                  .deckTitlesString
                  .length,
              itemBuilder: (BuildContext context, int index) {
                final deck = Provider.of<HomepageProvider>(context, listen: false).deckTitlesData[index];
                return Column(
                  children: [
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () => context.router.push(DeckRoute(deck: deck)),
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              child: Center(
                                child: Text(
                                  Provider.of<HomepageProvider>(context, listen: false).deckTitlesData[index].name,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20), 
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.router.push(const NewdeckRoute()),
        label: const Text('New Deck'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}