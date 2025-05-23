import 'package:flutter/material.dart';

class LevelProvider extends ChangeNotifier {
  int _selectedLevelIndex = 0;

  int get selectedLevelIndex => _selectedLevelIndex;

  void setLevel(int index) {
    _selectedLevelIndex = index;
    notifyListeners();
  }
}
