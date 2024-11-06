class BalanceResponse {
  final String jsonrpc;
  final int id;
  final String result;

  const BalanceResponse(
      {required this.id, required this.jsonrpc, required this.result});

  factory BalanceResponse.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "jsonrpc": String jsonrpc,
        'id': int id,
        'result': String result,
      } =>
        BalanceResponse(
          jsonrpc: jsonrpc,
          id: id,
          result: result,
        ),
      _ => throw const FormatException('Failed to load BalanceResponse.'),
    };
  }
}
