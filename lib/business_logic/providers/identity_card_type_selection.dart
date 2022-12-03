import 'package:flutter/material.dart';

class IdentityCardTypeSelection extends ChangeNotifier{
  final List<String> items = ['National Identity Card', 'Passport'];
  String _selectedItem = 'National Identity Card';

  String get selectedItem => _selectedItem;

  void updateSelectedItem(value) {
      _selectedItem = value;
      notifyListeners();
  }

}