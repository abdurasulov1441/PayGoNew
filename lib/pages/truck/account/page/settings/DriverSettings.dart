import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:paygo/app/router.dart';
import 'package:paygo/services/db/cache.dart';
import 'package:paygo/services/language/language_select_page.dart';
import 'package:paygo/services/style/app_colors.dart';
import 'package:paygo/services/style/app_style.dart';
import 'package:url_launcher/url_launcher.dart';

final gpsEnabledProvider = StateProvider<bool>((ref) => false);
final notificationEnabledProvider = StateProvider<bool>((ref) => false);

class Taxidriversettings extends ConsumerWidget {
  const Taxidriversettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isGpsEnabled = ref.watch(gpsEnabledProvider);
    final isNotificationEnabled = ref.watch(notificationEnabledProvider);
    final InAppReview inAppReview = InAppReview.instance;

    Future<void> requestReview() async {
      if (await inAppReview.isAvailable()) {
        await inAppReview.requestReview();
      } else {
        await inAppReview.openStoreListing();
      }
    }

    void _launchPrivacyPolicy() async {
      final Uri url = Uri.parse("http://appdata.uz/paygo_privacy.pdf");
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Не удалось открыть $url');
      }
    }

    Future<void> _loadSettings() async {
      ref.read(gpsEnabledProvider.notifier).state =
          cache.getBool('isGPS') ?? false;
      ref.read(notificationEnabledProvider.notifier).state =
          cache.getBool('isNotification') ?? false;
    }

    Future<void> _toggleGps(bool value) async {
      await cache.setBool('isGPS', value);
      ref.read(gpsEnabledProvider.notifier).state = value;
    }

    Future<void> _toggleNotification(bool value) async {
      await cache.setBool('isNotification', value);
      ref.read(notificationEnabledProvider.notifier).state = value;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadSettings();
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'settings'.tr(),
          style: AppStyle.fontStyle.copyWith(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.grade1,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 10),
          _buildSwitchItem(
            title: 'notifications',
            icon: Icons.notifications_outlined,
            value: isNotificationEnabled,
            onChanged: _toggleNotification,
          ),
          _buildSwitchItem(
            title: 'show_location',
            icon: Icons.location_on_outlined,
            value: isGpsEnabled,
            onChanged: _toggleGps,
          ),
          _buildSettingsItem(
            title: 'privacy_policy',
            icon: Icons.lock_outline,
            onTap: _launchPrivacyPolicy,
          ),
          _buildSettingsItem(
            title: 'choose_language',
            icon: Icons.language,
            onTap: () => showLanguageBottomSheet(context, ref),
          ),
          _buildSettingsItem(
            title: 'mark',
            icon: Icons.star_outline,
            onTap: requestReview,
          ),
          _buildSettingsItem(
            title: 'about_app',
            icon: Icons.info_outline,
            onTap: () => context.push(Routes.appInfoPage),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.grade1, size: 30),
      title: Text(
        title.tr(),
        style: AppStyle.fontStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
        color: AppColors.grade1,
      ),
      onTap: onTap,
    );
  }

  Widget _buildSwitchItem({
    required String title,
    required IconData icon,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.grade1, size: 30),
      title: Text(
        title.tr(),
        style: AppStyle.fontStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.grade1,
      ),
    );
  }
}
