import 'package:flashcards/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flashcards/pages/create/create.dart';
import 'package:flashcards/pages/review/review.dart';
import 'package:flashcards/pages/deck/deck.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const Homepage(),
        '/create': (context) => const CreatePage(),
        '/review': (context) => const ReviewPage(),
        '/deck': (context) => const DeckPage(),
      },
    );
  }
}
