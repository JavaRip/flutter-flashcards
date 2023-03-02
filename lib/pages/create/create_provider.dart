import "package:flutter/foundation.dart";
import "package:flutter/src/widgets/framework.dart";

class CreateFlashcardProvider extends ChangeNotifier {
  String _frontText = '';
  String _backText = '';
  String _card = '';

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

  void saveCard(BuildContext context) {
    _card = 'hello world';
    print('front');
    print(_frontText);
    print('back');
    print(_backText);
  }
}
