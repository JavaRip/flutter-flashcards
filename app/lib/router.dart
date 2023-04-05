import 'package:auto_route/annotations.dart';
import 'package:flashcards/pages/create/create.dart';
import 'package:flashcards/pages/newdeck/newdeck.dart';
import 'package:flashcards/pages/homepage.dart';
import 'package:flashcards/pages/deck/deck.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Homepage, initial: true),
    AutoRoute(page: CreatePage),
    AutoRoute(page: DeckPage),
    AutoRoute(page: NewdeckPage),
  ],
)
class $AppRouter {}
