import 'package:flutter/material.dart' hide Action, State;

class ChangeNotifierStore extends ChangeNotifier {
  int count = 0;

  void increment() {
    ++count;
    notifyListeners();
  }
}