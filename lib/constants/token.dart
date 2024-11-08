import 'package:balancer/constants/chains.dart';
import 'package:balancer/constants/contract_addresses.dart';
import 'package:web3dart/web3dart.dart';

class Token {
  final ChainId chainId;
  final EthereumAddress address;
  final String name;
  final String symbol;
  final int decimals;
  final Uri logoURI;

  const Token({
    required this.chainId,
    required this.address,
    required this.name,
    required this.symbol,
    required this.decimals,
    required this.logoURI,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      chainId: ChainId.fromId(json['chainId']),
      address: EthereumAddress.fromHex(json['address']),
      name: json['name'],
      symbol: json['symbol'],
      decimals: json['decimals'],
      logoURI: Uri.parse(json['logoURI']),
    );
  }
}

class TokenWithBalance extends Token {
  final String balance;

  const TokenWithBalance({
    required super.chainId,
    required super.address,
    required super.name,
    required super.symbol,
    required super.decimals,
    required super.logoURI,
    required this.balance,
  });

  factory TokenWithBalance.fromJson(Map<String, dynamic> json) {
    return TokenWithBalance(
      chainId: json['chainId'],
      address: json['address'],
      name: json['name'],
      symbol: json['symbol'],
      decimals: json['decimals'],
      logoURI: Uri.parse(json['logoURI']),
      balance: json['balance'],
    );
  }
}

Map<ChainId, Token> nativeToken = {
  ChainId.mainnet: Token(
    chainId: ChainId.mainnet,
    address: ContractAddresses.nativeTokenAddres,
    name: 'Ether',
    symbol: 'ETH',
    decimals: 18,
    logoURI: Uri.parse('https://worldvectorlogo.com/ru/logo/ethereum-eth'),
  ),
  ChainId.optimism: Token(
    chainId: ChainId.optimism,
    address: ContractAddresses.nativeTokenAddres,
    name: 'Ether',
    symbol: 'ETH',
    decimals: 18,
    logoURI: Uri.parse('https://worldvectorlogo.com/ru/logo/ethereum-eth'),
  ),
  ChainId.bnb: Token(
    chainId: ChainId.bnb,
    address: ContractAddresses.nativeTokenAddres,
    name: 'Binance',
    symbol: 'BNB',
    decimals: 9,
    logoURI: Uri.parse('https://worldvectorlogo.com/ru/logo/ethereum-eth'),
  ),
  ChainId.polygon: Token(
    chainId: ChainId.polygon,
    address: ContractAddresses.nativeTokenAddres,
    name: 'Polygon',
    symbol: 'POS',
    decimals: 18,
    logoURI: Uri.parse('https://worldvectorlogo.com/ru/logo/ethereum-eth'),
  ),
  ChainId.zkSync: Token(
    chainId: ChainId.zkSync,
    address: ContractAddresses.nativeTokenAddres,
    name: 'Ether',
    symbol: 'ETH',
    decimals: 18,
    logoURI: Uri.parse('https://worldvectorlogo.com/ru/logo/ethereum-eth'),
  ),
  ChainId.base: Token(
    chainId: ChainId.base,
    address: ContractAddresses.nativeTokenAddres,
    name: 'Ether',
    symbol: 'ETH',
    decimals: 18,
    logoURI: Uri.parse('https://worldvectorlogo.com/ru/logo/ethereum-eth'),
  ),
  ChainId.blast: Token(
    chainId: ChainId.blast,
    address: ContractAddresses.nativeTokenAddres,
    name: 'Ether',
    symbol: 'ETH',
    decimals: 18,
    logoURI: Uri.parse('https://worldvectorlogo.com/ru/logo/ethereum-eth'),
  ),
  ChainId.arbitrum: Token(
    chainId: ChainId.arbitrum,
    address: ContractAddresses.nativeTokenAddres,
    name: 'Ether',
    symbol: 'ETH',
    decimals: 18,
    logoURI: Uri.parse('https://worldvectorlogo.com/ru/logo/ethereum-eth'),
  ),
  ChainId.celo: Token(
    chainId: ChainId.celo,
    address: ContractAddresses.nativeTokenAddres,
    name: 'Ether',
    symbol: 'ETH',
    decimals: 18,
    logoURI: Uri.parse('https://worldvectorlogo.com/ru/logo/ethereum-eth'),
  ),
  ChainId.avalanche: Token(
    chainId: ChainId.avalanche,
    address: ContractAddresses.nativeTokenAddres,
    name: 'Ether',
    symbol: 'ETH',
    decimals: 18,
    logoURI: Uri.parse('https://worldvectorlogo.com/ru/logo/ethereum-eth'),
  ),
};
