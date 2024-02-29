import 'package:flutter/material.dart';

import '../models/transation_item.dart';

class BudgetService extends ChangeNotifier {
  double _budget = 0;

  double get budget => _budget;

  double balance = 0.0;

  List<TransactionItem> _items = [];
  List<TransactionItem> get items => _items;

  set budget(double value) {
    _budget = value;
    notifyListeners();
  }

  void addItem(TransactionItem item) {
    _items.add(item);
    updateBalance(item);
    notifyListeners();
  }

  void updateBalance(TransactionItem item) {
    if (item.isExpense) {
      balance += item.amount;
    } else {
      balance -= item.amount;
    }
  }
}