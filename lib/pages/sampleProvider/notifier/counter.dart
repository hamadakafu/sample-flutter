import 'package:flutter/widgets.dart';

class CounterStore with ChangeNotifier {
  int count = 0;

  void incrementCounter() {
    count++;
    notifyListeners();
  }
}
