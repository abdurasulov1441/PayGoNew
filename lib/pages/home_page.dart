import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:paygo/app/router.dart';
import 'package:paygo/services/style/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _navigateBasedOnRole(BuildContext context, int roleId, int status) {
    if (status == 0) {
      router.go(Routes.blockedPage);
    } else {
      switch (roleId) {
        case 1:
          router.go(Routes.userPage);
          break;
        case 2:
          router.go(Routes.truckPage);
          break;
        case 3:
          router.go(Routes.adminPage);
          break;
        case 5:
          router.go(Routes.loginPage);
          break;
        default:
          router.go(Routes.userPage);
      }
    }
  }

  Widget _buildRoleCard({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
    required int roleId,
    required int status,
  }) {
    return GestureDetector(
      onTap: () => _navigateBasedOnRole(context, roleId, status),
      child: Card(
        color: AppColors.backgroundColor,
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: color.withOpacity(0.2),
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 16),
              Text(label, style: const TextStyle(fontSize: 18)),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ui,
      appBar: AppBar(
        title: const Text("Выберите роль"),
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Lottie.asset('assets/lotties/loading_truck.json', height: 200),

          _buildRoleCard(
            context: context,
            icon: Icons.person,
            label: "Пассажир (User)",
            color: Colors.blue,
            roleId: 1,
            status: 1,
          ),
          _buildRoleCard(
            context: context,
            icon: Icons.local_shipping,
            label: "Водитель (Truck)",
            color: Colors.orange,
            roleId: 2,
            status: 1,
          ),
          _buildRoleCard(
            context: context,
            icon: Icons.admin_panel_settings,
            label: "Администратор (Admin)",
            color: Colors.green,
            roleId: 3,
            status: 1,
          ),
          _buildRoleCard(
            context: context,
            icon: Icons.block,
            label: "Заблокирован",
            color: Colors.red,
            roleId: 1,
            status: 0,
          ),
          _buildRoleCard(
            context: context,
            icon: Icons.login,
            label: "Login",
            color: Colors.yellow,
            roleId: 5,
            status: 1,
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// import 'package:lottie/lottie.dart';
// import 'package:paygo/app/router.dart';
// import 'package:paygo/services/style/app_colors.dart';

// class HomePage extends StatelessWidget {
//   final int roleId;
//   final int status;

//   const HomePage({super.key, this.roleId = 1, this.status = 1});

//   Future<Map<String, int>> _fetchUserData() async {
//     await Future.delayed(const Duration(seconds: 2));
//     return {'role_id': roleId, 'status': status};
//   }

//   void _navigateBasedOnRole(int roleId, int status) {
//     if (status == 0) {
//       router.go(Routes.blockedPage);
//     } else {
//       switch (roleId) {
//         case 1:
//           router.go(Routes.userPage);
//           break;
//         case 2:
//           router.go(Routes.truckPage);
//           break;
//         case 3:
//           router.go(Routes.adminPage);
//           break;
//         default:
//           router.go(Routes.userPage);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Map<String, int>>(
//       future: _fetchUserData(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Scaffold(
//             backgroundColor: AppColors.backgroundColor,
//             body: Center(
//               child: Lottie.asset(
//                 'assets/lotties/loading_truck.json',
//                 width: 200,
//                 height: 200,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           );
//         } else if (snapshot.hasData) {
//           final roleId = snapshot.data!['role_id']!;
//           final status = snapshot.data!['status']!;
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             _navigateBasedOnRole(roleId, status);
//           });

//           return const Scaffold(
//             backgroundColor: AppColors.backgroundColor,
//             body: SizedBox.shrink(),
//           );
//         } else {
//           return Scaffold(
//             body: Center(
//               child: Text(
//                 'Error loading user data',
//                 style: TextStyle(color: AppColors.grade2, fontSize: 24),
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
