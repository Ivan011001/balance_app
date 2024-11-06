import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import "package:balancer/models/balance_response.dart";

Future<BalanceResponse> fetchBalance(String address) async {
  final response = await http.post(Uri.parse('https://eth.llamarpc.com'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "method": "eth_getBalance",
        "params": [address, "latest"],
        "id": 1,
        "jsonrpc": "2.0"
      }));

  if (response.statusCode == HttpStatus.accepted ||
      response.statusCode == HttpStatus.ok ||
      response.statusCode == HttpStatus.created) {
    return BalanceResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to get balance.');
  }
}
