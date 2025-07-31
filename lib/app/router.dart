import 'package:go_router/go_router.dart';
import 'package:paygo/pages/admin/admin_page.dart';
import 'package:paygo/pages/auth/login/page/login_page.dart';
import 'package:paygo/pages/auth/register/page/register_page.dart';
import 'package:paygo/pages/auth/role/page/role_select_page.dart';
import 'package:paygo/pages/auth/verify/page/smsverify.dart';
import 'package:paygo/pages/blocked_users_page.dart';
import 'package:paygo/pages/home_page.dart';
import 'package:paygo/pages/splash_page.dart';
import 'package:paygo/pages/truck/account/page/account_detail_info/account_detail_info_taksi.dart';
import 'package:paygo/pages/truck/account/page/get_balance/balance_page.dart';
import 'package:paygo/pages/truck/account/page/get_tarifs/tarifs_page.dart';
import 'package:paygo/pages/truck/account/page/payment_history/payment_history.dart';
import 'package:paygo/pages/truck/account/page/settings/app_info.dart';
import 'package:paygo/pages/truck/truck_page.dart';
import 'package:paygo/pages/user/home/page/create_order.dart';
import 'package:paygo/pages/user/home/page/search_truck.dart';
import 'package:paygo/pages/user/user_page.dart';

abstract class Routes {
  static const splashScreen = '/splashScreen';
  static const homePage = '/homePage';
  static const userPage = '/userPage';
  static const truckPage = '/truckPage';
  static const adminPage = '/adminPage';
  static const blockedPage = '/blockedPage';
  static const verifyPage = '/verifyPage';
  static const registerPage = '/registerPage';
  static const loginPage = '/loginPage';
  static const roleSelectPage = '/roleSelectPage';
  static const createOrderPage = '/createOrderPage';
  static const searchTruckPage = '/searchTruckPage';

  static const truckBalancePage = '/truckBalancePage';
  static const truckTarifsPage = '/truckTarifsPage';
  static const accountDetailInfoPage = '/accountDetailInfoPage';
  static const truckPaymentHistory = '/truckPaymentHistory';
  static const truckSettingsPage = '/truckSettingsPage';
  static const appInfoPage = '/appInfoPage';
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
      builder: (context, state) {
        final phoneNumber = state.extra as String;
        return VerifyPage(phoneNumber: phoneNumber);
      },
    ),
    GoRoute(
      path: Routes.roleSelectPage,
      builder: (context, state) => const RoleSelectPage(),
    ),
    GoRoute(
      path: Routes.createOrderPage,
      builder: (context, state) => const CreateOrderPage(),
    ),
    GoRoute(
      path: Routes.searchTruckPage,
      builder: (context, state) => const SearchTruckPage(),
    ),
    GoRoute(
      path: Routes.truckBalancePage,
      builder: (context, state) => const BalancePage(),
    ),
    GoRoute(
      path: Routes.truckTarifsPage,
      builder: (context, state) => const TariffsPage(),
    ),
    GoRoute(
      path: Routes.accountDetailInfoPage,
      builder: (context, state) => const AccountDetailInfo(),
    ),
    GoRoute(
      path: Routes.truckPaymentHistory,
      builder: (context, state) => const PaymentHistoryPage(),
    ),
    GoRoute(
      path: Routes.appInfoPage,
      builder: (context, state) => const AppInfo(),
    ),
  ],
);
