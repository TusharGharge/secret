import 'package:flutter/foundation.dart';
import 'package:user/Provider/Quiz.dart';

class QuizProvider with ChangeNotifier {
  List<Quiz> _items = [];
  List<Quiz> get items {
    return [..._items];
  }
}
