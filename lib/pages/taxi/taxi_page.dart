import 'package:flutter/material.dart';

class TaxiPage extends StatelessWidget {
  const TaxiPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Taxi Page')),
      body: const Center(
        child: Text('Welcome, Taxi Driver!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}