import 'package:flutter/material.dart';

class BlockedPage extends StatelessWidget {
  const BlockedPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Blocked')),
      body: const Center(
        child: Text(
          'Account Blocked',
          style: TextStyle(fontSize: 24, color: Colors.red),
        ),
      ),
    );
  }
}
