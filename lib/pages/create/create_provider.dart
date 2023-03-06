import "package:flutter/foundation.dart";
import "package:flutter/src/widgets/framework.dart";

class Card {
  String front;
  String back;

  Card(this.front, this.back);
}

class CreateFlashcardProvider extends ChangeNotifier {
  String _frontText = '';
  String _backText = '';
  final List<Card> _cards = [];

  String get frontText => _frontText;
  String get backText => _backText;
  List<Card> get cards => _cards;

  void setFrontText(String value) {
    _frontText = value;
    notifyListeners();
  }

  void setBackText(String value) {
    _backText = value;
    notifyListeners();
  }

  void saveCard() {
    _cards.add(Card(frontText, backText));
    notifyListeners();
  }

  void saveDeck() {
    print('saving decks to databse');
  }
}
