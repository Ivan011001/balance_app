import 'package:flutter/material.dart';

import 'package:balancer/models/balance_response.dart';
import 'package:balancer/utils/converter.dart';

class UserBalance extends StatelessWidget {
  const UserBalance({super.key, required this.balance});

  final Future<BalanceResponse>? balance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Your balance is:'),
        FutureBuilder(
          future: balance,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator.adaptive();
            } else if (snapshot.hasData) {
              BigInt decValue = Converter.fromHex(snapshot.data!.result);
              String value = Converter.fromWei(decValue);

              return Text("$value ETH");
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
