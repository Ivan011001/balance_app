import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:balancer/providers/app_state.dart';
import 'package:balancer/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Balancer',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'eth_getBalance'),
      ),
    );
  }
}
