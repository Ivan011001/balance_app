import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:balancer/providers/app_state.dart';
import 'package:balancer/widgets/user_balance.dart';
import 'package:balancer/widgets/user_form.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserBalance(balance: appState.balance),
            const SizedBox(height: 100),
            UserForm(getBalance: appState.getBalance),
          ],
        ),
      ),
    );
  }
}
