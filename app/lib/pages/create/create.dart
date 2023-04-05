import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'create_provider.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nav Bar')),
      body: ChangeNotifierProvider(
        create: (context) => CreateFlashcardProvider(),
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
        TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Front of card',
          ),
          onChanged: (text) {
            Provider.of<CreateFlashcardProvider>(context, listen: false)
                .setFrontText(text);
          },
        ),
        const Spacer(),
        TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Back of card',
          ),
          onChanged: (text) {
            Provider.of<CreateFlashcardProvider>(context, listen: false)
                .setBackText(text);
          },
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            Provider.of<CreateFlashcardProvider>(context, listen: false)
                .saveCard();
          },
          child: const Text('Create Card'),
        ),
        const Spacer(),
      ],
    );
  }
}
