import 'package:flutter/material.dart';

class TruckPage extends StatelessWidget {
  const TruckPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Truck Page')),
      body: const Center(
        child: Text('Welcome, Truck Driver!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
