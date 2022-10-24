import 'package:flutter/material.dart';
import 'package:loy_eat_merchant_app/src/constants/constants.dart';
import 'package:loy_eat_merchant_app/src/screens/account/account_screen.dart';
import 'package:loy_eat_merchant_app/src/screens/menu/menu_screen.dart';
import 'package:loy_eat_merchant_app/src/screens/order/order_screen.dart';

import '../screens/home/home_screen.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final kTabPages = <Widget>[
      const HomeScreen(),
      MenuScreen(),
      OrderScreen(),
      const AccountScreen(),
    ];
    final kBottomNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: 'Home',
        activeIcon: Icon(Icons.home_rounded),
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.restaurant_menu_outlined),
        label: 'Menu',
        activeIcon: Icon(Icons.restaurant_menu_rounded),
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_basket_outlined),
        label: 'Order',
        activeIcon: Icon(Icons.shopping_basket_rounded),
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        label: 'Account',
        activeIcon: Icon(Icons.person_rounded),
      ),
    ];
    assert(kTabPages.length == kBottomNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      items: kBottomNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryColor,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      body: kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
