import 'package:flutter/material.dart';

import 'package:balancer/constants/token.dart';

class UserBalance extends StatelessWidget {
  const UserBalance({super.key, required this.tokenWithBalances});

  final Future<List<TokenWithBalance>>? tokenWithBalances;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Your balances:'),
        FutureBuilder(
          future: tokenWithBalances,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator.adaptive();
            } else if (snapshot.hasData) {
              return Column(
                children: [
                  for (var token in snapshot.data!)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(token.symbol),
                        const Text(' - '),
                        Text(token.balance),
                      ],
                    ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const SizedBox.shrink();
          },
        )
      ],
    );
  }
}
