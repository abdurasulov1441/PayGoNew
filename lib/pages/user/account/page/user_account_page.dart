import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paygo/app/router.dart';

class UserAccountPage extends StatelessWidget {
  const UserAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Profile Header
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey.shade300,
            child: const Icon(Icons.person, size: 40, color: Colors.white),
          ),
          const SizedBox(height: 10),
          const Text(
            "Ism Familiya",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),

          // Menu
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildMenuItem(
                  icon: Icons.person_outline,
                  title: "Akkount ma'lumotlari",
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.history,
                  title: "Yuk tarixi",
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.language,
                  title: "Til",
                  onTap: () {},
                ),
                const Divider(height: 32),
                _buildMenuItem(
                  icon: Icons.logout,
                  title: "Chiqish",
                  onTap: () {
                    context.go(Routes.homePage);
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text("Chiqildi")));
                  },
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
    Color color = Colors.black87,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color, fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
