import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'review_provider.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Deck Page')),
      body: ChangeNotifierProvider(
        create: (context) => ReviewProvider(),
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
      children: ([
        ElevatedButton(
          onPressed: () {
            Provider.of<ReviewProvider>(context, listen: false).helloWorld();
          },
          child: const Text('hello world'),
        ),
      ]),
    );
  }
}
