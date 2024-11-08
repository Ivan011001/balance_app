import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:balancer/constants/chains.dart';
import 'package:balancer/constants/token.dart';

class TokenService {
  static final Uri _tokenAPI =
      Uri.parse('https://ipfs.io/ipns/tokens.uniswap.org');

  static Future<Map<ChainId, List<Token>>> fetchTokens() async {
    try {
      final response = await http.get(_tokenAPI);
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      if (data.containsKey('tokens') && data['tokens'] is List) {
        final List<dynamic> tokens = data['tokens'];

        Map<ChainId, List<Token>> tokensByChain = {};

        for (var tokenData in tokens) {
          final token = Token.fromJson(tokenData);

          tokensByChain.putIfAbsent(token.chainId, () => []).add(token);
        }

        return tokensByChain;
      } else {
        throw Exception('Not found tokens');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
