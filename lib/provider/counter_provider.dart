//Logic Part -> incrementCounter, decrementCounter-> CounterProvider class

import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners(); // Notify listeners to rebuild widgets that depend on this provider
    print("Counter is $counter");
  }

  void decrementCounter() {
    counter--;
    notifyListeners(); // Notify listeners to rebuild widgets that depend on this provider
    print("Counter is $counter");
  }
}
