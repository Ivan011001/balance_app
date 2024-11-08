import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:balancer/services/token_service.dart';
import 'package:web3dart/web3dart.dart';

import 'package:balancer/constants/chains.dart';
import 'package:balancer/constants/token.dart';
import 'package:balancer/constants/providers.dart';
import 'package:balancer/constants/contract_abis.dart';
import 'package:balancer/constants/contract_addresses.dart';

class BalanceService {
  static final mutlicall = DeployedContract(
      ContractAbis.multicallAbi, ContractAddresses.multicall3Address);

  static Future<List<TokenWithBalance>> fetchBalances(
      EthereumAddress address, ChainId chainId) async {
    final nativeBalance = await fetchNativeBalance(address, chainId);
    final erc20balances = await fetchErc20Balances(address, chainId);

    if (nativeBalance == null) return [...erc20balances];

    return [nativeBalance, ...erc20balances];
  }

  static Future<TokenWithBalance?> fetchNativeBalance(
      EthereumAddress address, ChainId chainId) async {
    try {
      final balanceInWei =
          await Providers.ethClients[chainId]!.getBalance(address);
      if (balanceInWei == EtherAmount.zero()) return null;
      final balance =
          balanceInWei.getValueInUnit(EtherUnit.ether).toStringAsFixed(5);

      Token? token = nativeToken[chainId];
      if (token == null) return null;

      return TokenWithBalance(
        chainId: token.chainId,
        address: token.address,
        name: token.name,
        symbol: token.symbol,
        decimals: token.decimals,
        logoURI: token.logoURI,
        balance: balance,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<TokenWithBalance>> fetchErc20Balances(
      EthereumAddress address, ChainId chainId) async {
    try {
      final Map<ChainId, List<Token>> tokensMap =
          await TokenService.fetchTokens();
      final List<EthereumAddress> contractAddresses =
          tokensMap[chainId]!.map((token) => token.address).toList();

      final calls = contractAddresses
          .map((contractAddress) => [
                contractAddress,
                true,
                encodeBalanceOf(address),
              ])
          .toList();

      final responses = await Providers.ethClients[chainId]!.call(
        contract: mutlicall,
        function: mutlicall.function('aggregate3'),
        params: [calls],
      );

      final balances =
          responses[0].map((response) => decodeBalanceOf(response[1])).toList();

      final List<TokenWithBalance> tokenWithBalances = [];

      for (var i = 0; i < tokensMap[chainId]!.length; i++) {
        final BigInt balance = balances[i];

        if (balance == BigInt.from(0)) continue;

        final token = tokensMap[chainId]![i];

        final divisor = BigInt.from(pow(10, token.decimals));
        final finalBalance = (balance / divisor);

        tokenWithBalances.add(TokenWithBalance(
          chainId: token.chainId,
          address: token.address,
          name: token.name,
          symbol: token.symbol,
          decimals: token.decimals,
          logoURI: token.logoURI,
          balance: finalBalance.toStringAsFixed(5),
        ));
      }

      return tokenWithBalances;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Uint8List encodeBalanceOf(EthereumAddress address) {
    const function = ContractFunction(
        'balanceOf', [FunctionParameter("_owner", AddressType())]);

    return function.encodeCall([address]);
  }

  static BigInt decodeBalanceOf(dynamic data) {
    Uint8List byteData = Uint8List.fromList(data);
    return BigInt.parse(
      byteData.map((b) => b.toRadixString(16).padLeft(2, '0')).join(),
      radix: 16,
    );
  }
}
