import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';

class BalanceService {
  static const String _rpcUrl = 'https://eth.llamarpc.com';
  static final http.Client _client = http.Client();
  static final Web3Client _ethClient = Web3Client(_rpcUrl, _client);

  static Future<String> fetchBalance(EthereumAddress address) async {
    try {
      final balanceInWei = await _ethClient.getBalance(address);
      final balance = balanceInWei.getValueInUnit(EtherUnit.ether).toString();
      return balance;
    } catch (e) {
      throw Exception(e);
    }
  }
}
