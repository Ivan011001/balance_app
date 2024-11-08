import 'package:flutter/material.dart';

import 'package:balancer/constants/chains.dart';

class ChainSelect extends StatelessWidget {
  const ChainSelect(
      {super.key, required this.chainId, required this.changeChain});

  final ChainId chainId;
  final dynamic changeChain;

  @override
  Widget build(BuildContext context) {
    // return Text('hello: ${chainId.id}');
    return DropdownButton(
      items: chains.entries
          .map((chain) => DropdownMenuItem(
                value: chain.key,
                child: Text(chain.value),
              ))
          .toList(),
      onChanged: (value) {
        changeChain(value);
      },
      value: chainId,
    );
  }
}
