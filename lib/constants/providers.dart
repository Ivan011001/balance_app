import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:balancer/constants/chains.dart';

class Providers {
  static final http.Client _client = http.Client();
  static final _infuraApiKey = dotenv.get('INFURA_API_KEY');

  Providers._();

  static final Map<ChainId, Web3Client> ethClients = {
    ChainId.mainnet:
        Web3Client('https://mainnet.infura.io/v3/$_infuraApiKey', _client),
    ChainId.optimism: Web3Client(
        'https://optimism-mainnet.infura.io/v3/$_infuraApiKey', _client),
    ChainId.polygon: Web3Client(
        'https://polygon-mainnet.infura.io/v3/$_infuraApiKey', _client),
    ChainId.arbitrum: Web3Client(
        'https://arbitrum-mainnet.infura.io/v3/$_infuraApiKey', _client),
    ChainId.celo:
        Web3Client('https://celo-mainnet.infura.io/v3/$_infuraApiKey', _client),
    ChainId.avalanche: Web3Client(
        'https://avalanche-mainnet.infura.io/v3/$_infuraApiKey', _client),
  };
}
