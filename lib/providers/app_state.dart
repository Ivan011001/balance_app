import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';

import 'package:balancer/services/balance_service.dart';

class MyAppState extends ChangeNotifier {
  Future<String>? balance;

  void getBalance(EthereumAddress address) {
    balance = BalanceService.fetchBalance(address);
    notifyListeners();
  }
}
