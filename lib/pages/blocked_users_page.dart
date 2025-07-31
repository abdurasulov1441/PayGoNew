import 'package:flutter/material.dart';
import 'package:paygo/app/router.dart';

class BlockedPage extends StatelessWidget {
  const BlockedPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Blocked')),
      body: Column(
        children: [
          const Center(
            child: Text(
              'Account Blocked',
              style: TextStyle(fontSize: 24, color: Colors.red),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              router.go(Routes.homePage);
            },
            child: const Text('Go to Home'),
          ),
        ],
      ),
    );
  }
}
