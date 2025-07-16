import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paygo/services/style/app_colors.dart';
import 'package:paygo/services/style/app_style.dart';

class UserPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.grade1,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/user_avatar.png'),
          ),
          const SizedBox(width: 12),

          Text(
            'Abdulaziz Abdurasulov',
            style: AppStyle.fontStyle.copyWith(
              color: AppColors.backgroundColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/weather_midle.svg',
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 6),
            Text(
              '27°C',
              style: AppStyle.fontStyle.copyWith(
                color: AppColors.backgroundColor,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
