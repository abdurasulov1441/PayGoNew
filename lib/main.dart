import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paygo/app/app.dart';
import 'package:paygo/services/db/cache.dart';
import 'package:paygo/services/firebase_notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
    debugPrint('Firebase initialized successfully');

    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  } catch (e) {
    debugPrint('Firebase initialization error: $e');
  }
  NotificationService().initNotifications();
  try {
    await cache.init();
    debugPrint('Cache initialized successfully');
  } catch (e) {
    debugPrint('Cache initialization error: $e');
  }

  try {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    debugPrint('Orientation set successfully');
  } catch (e) {
    debugPrint('Orientation error: $e');
  }

  try {
    EasyLocalization.logger.enableBuildModes = [];
    await EasyLocalization.ensureInitialized();
    debugPrint('EasyLocalization initialized successfully');
  } catch (e) {
    debugPrint('EasyLocalization error: $e');
  }

  try {
    final savedLocaleCode = cache.getString('locale') ?? 'uz';
    debugPrint('Locale loaded: $savedLocaleCode');
    final initialLocale = ['uz', 'ru'].contains(savedLocaleCode)
        ? Locale(savedLocaleCode)
        : Locale('uz');

    runApp(
      ProviderScope(
        child: EasyLocalization(
          path: 'assets/translations',
          supportedLocales: const [Locale('uz'), Locale('ru')],
          saveLocale: true,
          startLocale: initialLocale,
          child: App(),
        ),
      ),
    );
  } catch (e) {
    debugPrint('Error starting app: $e');
  }
}
