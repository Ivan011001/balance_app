import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';

import 'package:balancer/services/balance_service.dart';
import 'package:balancer/constants/chains.dart';
import 'package:balancer/constants/token.dart';

class MyAppState extends ChangeNotifier {
  Future<List<TokenWithBalance>>? tokenWithBalances;
  ChainId chainId = ChainId.mainnet;

  void getBalances(EthereumAddress address) {
    tokenWithBalances = BalanceService.fetchBalances(address, chainId);
    notifyListeners();
  }

  void changeChain(ChainId updatedChainId) {
    chainId = updatedChainId;
    notifyListeners();
  }
}
