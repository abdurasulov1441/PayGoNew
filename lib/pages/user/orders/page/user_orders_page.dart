import 'package:flutter/material.dart';

class UserOrdersPage extends StatelessWidget {
  const UserOrdersPage({super.key});

  Widget _buildOrderItem({required bool isActive}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.my_location, color: Colors.teal, size: 20),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  "456 Elm Street, Springfield",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("Payment", style: TextStyle(fontSize: 12)),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "\$12",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.black54, size: 20),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  "739 Main Street, Springfield",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text("Distance", style: TextStyle(fontSize: 12)),
                  SizedBox(height: 4),
                  Text("12Km", style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Order History",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
        actions: const [],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(24),
          child: Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              "Showing all your order history",
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Active orders",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _buildOrderItem(isActive: true),
          const SizedBox(height: 24),
          const Text(
            "Past orders",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _buildOrderItem(isActive: false),
          _buildOrderItem(isActive: false),
          _buildOrderItem(isActive: false),
        ],
      ),
    );
  }
}
