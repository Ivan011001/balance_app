import 'package:flutter/material.dart';

import 'package:balancer/models/balance_response.dart';
import 'package:balancer/services/balance_service.dart';

class MyAppState extends ChangeNotifier {
  Future<BalanceResponse>? balance;

  void getBalance(String address) {
    balance = fetchBalance(address.trim());
    notifyListeners();
  }
}
