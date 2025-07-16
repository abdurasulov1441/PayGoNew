import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:paygo/app/router.dart';
import 'package:paygo/pages/user/home/widgets/appbar_widget.dart';
import 'package:paygo/pages/user/home/widgets/custom_button.dart';
import 'package:paygo/services/style/app_colors.dart';
import 'package:paygo/services/style/app_style.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ui,
      appBar: UserPageAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            LottieBuilder.asset(
              'assets/lotties/truck.json',
              width: 350,
              height: 350,
            ),
            Row(
              children: [
                const SizedBox(width: 20),

                Text(
                  'Salom, Abdulaziz!',
                  style: AppStyle.fontStyle.copyWith(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 20),
                Text(
                  'Qayerga yuk olib boramiz?',
                  style: AppStyle.fontStyle.copyWith(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserHomeCustomButton(
                    text: 'Yuk joylashtirish',
                    icon: Icons.add,
                    onPressed: () {
                      router.push(Routes.createOrderPage);
                    },
                  ),

                  const SizedBox(height: 16),
                  UserHomeCustomButton(
                    text: 'Yuk mashinasi qidirish',
                    icon: Icons.search,
                    onPressed: () {
                      router.push(Routes.searchTruckPage);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
