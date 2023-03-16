import 'package:auto_route/annotations.dart';
import 'package:flashcards/pages/create/create.dart';
import 'package:flashcards/pages/deck/deck.dart';
import 'package:flashcards/pages/homepage.dart';
import 'package:flashcards/pages/review/review.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Homepage, initial: true),
    AutoRoute(page: CreatePage),
    AutoRoute(page: ReviewPage),
    AutoRoute(page: DeckPage),
  ],
)
class $AppRouter {}
