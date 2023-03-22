import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'newdeck_provider.dart';

class NewdeckPage extends StatelessWidget {
  const NewdeckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Deck')),
      body: ChangeNotifierProvider(
        create: (context) => NewdeckProvider(),
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
            Provider.of<NewdeckProvider>(context, listen: false)
                .setDeckName(text);
          },
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () async {
            await Provider.of<NewdeckProvider>(context, listen: false)
                .saveDeck();
          },
          child: const Text('Create Deck'),
        ),
        const Spacer(),
      ],
    );
  }
}
