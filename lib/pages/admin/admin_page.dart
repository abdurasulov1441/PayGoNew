import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paygo/app/router.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.push(Routes.homePage);
          },
          child: const Text('Go to Home Page'),
        ),
      ),
    );
  }
}
