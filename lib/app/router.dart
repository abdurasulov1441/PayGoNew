import 'package:go_router/go_router.dart';
import 'package:paygo/pages/admin/admin_page.dart';
import 'package:paygo/pages/auth/login/page/login_page.dart';
import 'package:paygo/pages/auth/register/page/register_page.dart';
import 'package:paygo/pages/auth/role/page/role_select_page.dart';
import 'package:paygo/pages/auth/verify/page/verify_page.dart';
import 'package:paygo/pages/blocked_users_page.dart';
import 'package:paygo/pages/home_page.dart';
import 'package:paygo/pages/splash_page.dart';
import 'package:paygo/pages/taxi/taxi_page.dart';
import 'package:paygo/pages/truck/truck_page.dart';
import 'package:paygo/pages/user/user_page.dart';

abstract class Routes {
  static const splashScreen = '/splashScreen';
  static const homePage = '/homePage';
  static const userPage = '/userPage';
  static const taxiPage = '/taxiPage';
  static const truckPage = '/truckPage';
  static const adminPage = '/adminPage';
  static const blockedPage = '/blockedPage';
  static const verifyPage = '/verifyPage';
  static const registerPage = '/registerPage';
  static const loginPage = '/loginPage';
  static const roleSelectPage = '/roleSelectPage';
}

String _initialLocation() {
  return Routes.splashScreen;
}

Object? _initialExtra() {
  return {};
}

final router = GoRouter(
  initialLocation: _initialLocation(),
  initialExtra: _initialExtra(),
  routes: [
    GoRoute(
      path: Routes.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.homePage,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: Routes.userPage,
      builder: (context, state) => const UserPage(),
    ),
    GoRoute(
      path: Routes.taxiPage,
      builder: (context, state) => const TaxiPage(),
    ),
    GoRoute(
      path: Routes.truckPage,
      builder: (context, state) => const TruckPage(),
    ),
    GoRoute(
      path: Routes.adminPage,
      builder: (context, state) => const AdminPage(),
    ),
    GoRoute(
      path: Routes.blockedPage,
      builder: (context, state) => const BlockedPage(),
    ),
    GoRoute(
      path: Routes.loginPage,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: Routes.registerPage,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: Routes.verifyPage,
      builder: (context, state) => const VerifyPage(),
    ),
    GoRoute(
      path: Routes.roleSelectPage,
      builder: (context, state) => const RoleSelectPage(),
    ),
  ],
);
