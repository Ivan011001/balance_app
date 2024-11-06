import 'package:flutter/material.dart';

class UserBalance extends StatelessWidget {
  const UserBalance({super.key, required this.balance});

  final Future<String>? balance;

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
              return Text("${snapshot.data} ETH");
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
