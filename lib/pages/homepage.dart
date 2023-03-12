import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/data.dart';
import 'create/create_provider.dart';
import 'homepage_provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Decks')),
      body: ChangeNotifierProvider(
        create: (context) => HomepageProvider(),
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
          return Container(
            height: 50,
            color: Colors.amber,
            child: const Center(child: Text('wooow')),
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
