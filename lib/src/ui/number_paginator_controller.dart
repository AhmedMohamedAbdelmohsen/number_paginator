import 'package:flutter/material.dart';

class NumberPaginatorController extends ChangeNotifier {
  int _currentPage = 0;
  int _pageNumbers = 0;

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  int get pageNumbers => _pageNumbers;

  set pageNumbers(int value) {
    _pageNumbers = value;
    notifyListeners();
  }

  /// Decreases page by 1 and notifies listeners
  prev() {
    _currentPage--;
    notifyListeners();
  }

  /// Increases page by 1 and notifies listeners
  next() {
    _currentPage++;
    notifyListeners();
  }

  moveToFirstPage() {
    if (_currentPage != 0) {
      _currentPage = 0;
      notifyListeners();
    }
  }

  moveToLastPage() {
    for (int i = _currentPage; i < (_pageNumbers - 1); i++) {
      _currentPage++;
    }
    notifyListeners();
  }

  /// Alias for setter
  navigateToPage(int index) {
    currentPage = index;
  }
}
