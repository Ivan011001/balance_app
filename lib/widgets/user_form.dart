import 'package:flutter/material.dart';

import 'package:balancer/utils/validators.dart';
import "package:balancer/constants/address_error_messages.dart";
import 'package:web3dart/web3dart.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key, required this.getBalances});

  final dynamic getBalances;

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final TextEditingController _controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 0),
            child: TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Paste your address',
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(fontSize: 14),
              validator: (String? value) {
                if (value == null || value.trim().isEmpty) {
                  return AddressErrorMessages.emptyAddress;
                } else if (!addressRegex.hasMatch(value)) {
                  return AddressErrorMessages.invalidAddress;
                }

                return null;
              },
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                try {
                  EthereumAddress address =
                      EthereumAddress.fromHex(_controller.text.trim());
                  widget.getBalances(address);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid Ethereum address.')),
                  );
                }
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Text('Balance'),
            ),
          ),
        ],
      ),
    );
  }
}
