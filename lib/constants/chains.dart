enum ChainId {
  mainnet(1),
  ropsten(3),
  rinkeby(4),
  goerli(5),
  optimism(10),
  lusko(42),
  bnb(56),
  polygon(137),
  zkSync(324),
  worldChain(480),
  base(8453),
  arbitrum(42161),
  celo(42220),
  avalanche(43114),
  mumbai(80001),
  blast(81457),
  zora(7777777),
  sepolia(11155111);

  final int id;
  const ChainId(this.id);

  static ChainId fromId(int id) {
    return ChainId.values.firstWhere(
      (chain) => chain.id == id,
      orElse: () => throw Exception('Unsupported chain id $id'),
    );
  }
}

Map<ChainId, String> chains = {
  ChainId.mainnet: 'Mainnet',
  ChainId.optimism: 'Optimism',
  ChainId.polygon: "Polygon",
  ChainId.arbitrum: 'Arbitrum',
  ChainId.celo: 'Celo',
  ChainId.avalanche: 'Avalanche',
};
