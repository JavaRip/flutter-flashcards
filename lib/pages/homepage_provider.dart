import 'package:flutter/foundation.dart';

class CreateFlashcardProvider extends ChangeNotifier {
  List<String> _deckTitles = [];

  List<String> get deckTitles => _deckTitles;

  void setDeckTitles(String value) {
    print('retrieve deck titles from db');
  }
}
