import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paygo/pages/user/news/page/user_news_page.dart';
import 'package:paygo/services/style/app_colors.dart';
import 'package:paygo/pages/truck/account/page/truck_account.dart';
import 'package:paygo/pages/truck/active_order/page/active_order_truck.dart';
import 'package:paygo/pages/truck/order/page/order_truck.dart';

class TruckPage extends StatefulWidget {
  const TruckPage({super.key});

  @override
  _TruckPageState createState() => _TruckPageState();
}

class _TruckPageState extends State<TruckPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    OrderTruck(),
    ActiveOrderTruck(),
    UserNewsPage(),
    // NewsTruck(),
    TruckAccount(),
  ];

  final List<Map<String, dynamic>> _menuItems = [
    {'icon': 'assets/icons/orders.svg', 'label': 'Buyurtmalar'},
    {'icon': 'assets/icons/orders.svg', 'label': 'Faol Buyurtmalar'},
    {'icon': 'assets/icons/news.svg', 'label': 'Yangiliklar'},
    {'icon': 'assets/icons/account.svg', 'label': 'Akkaunt'},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.backgroundColor,
        items: _menuItems
            .map(
              (item) => BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  item['icon'],
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == _menuItems.indexOf(item)
                        ? AppColors.grade1
                        : Colors.grey,
                    BlendMode.srcIn,
                  ),
                ),
                label: item['label'],
              ),
            )
            .toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.grade1,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
