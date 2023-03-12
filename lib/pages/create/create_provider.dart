import 'package:flutter/foundation.dart';
import '../../data/data.dart';

class CreateFlashcardProvider extends ChangeNotifier {
  String _frontText = '';
  String _backText = '';

  String get frontText => _frontText;
  String get backText => _backText;

  void setFrontText(String value) {
    _frontText = value;
    notifyListeners();
  }

  void setBackText(String value) {
    _backText = value;
    notifyListeners();
  }

  void saveCard() {
    notifyListeners();
  }
}
