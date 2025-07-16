import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:paygo/app/router.dart';
import 'package:paygo/services/style/app_colors.dart';

class HomePage extends StatelessWidget {
  final int roleId;
  final int status;

  const HomePage({super.key, this.roleId = 1, this.status = 1});

  Future<Map<String, int>> _fetchUserData() async {
    await Future.delayed(const Duration(seconds: 2));
    return {'role_id': roleId, 'status': status};
  }

  void _navigateBasedOnRole(BuildContext context, int roleId, int status) {
    if (status == 0) {
      context.go(Routes.blockedPage);
    } else {
      switch (roleId) {
        case 1:
          context.go(Routes.userPage);
          break;
        case 2:
          context.go(Routes.truckPage);
          break;
        case 3:
          context.go(Routes.adminPage);
          break;
        default:
          context.go(Routes.userPage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, int>>(
      future: _fetchUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: Center(
              child: Lottie.asset(
                'assets/lotties/loading_truck.json',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
          );
        } else if (snapshot.hasData) {
          final roleId = snapshot.data!['role_id']!;
          final status = snapshot.data!['status']!;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _navigateBasedOnRole(context, roleId, status);
          });

          return const Scaffold(body: SizedBox.shrink());
        } else {
          return Scaffold(
            body: Center(
              child: Text(
                'Error loading user data',
                style: TextStyle(color: AppColors.grade2, fontSize: 24),
              ),
            ),
          );
        }
      },
    );
  }
}
