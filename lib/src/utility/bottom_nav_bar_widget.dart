import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/src/constants/cache_helper.dart';
import 'package:loy_eat_merchant_app/src/constants/constants.dart';
import 'package:loy_eat_merchant_app/src/screens/account/account_screen.dart';
import 'package:loy_eat_merchant_app/src/screens/account/account_view_model.dart';
import 'package:loy_eat_merchant_app/src/screens/home/home_view_model.dart';
import 'package:loy_eat_merchant_app/src/screens/menu/menu_screen.dart';
import 'package:loy_eat_merchant_app/src/screens/menu/menu_view_model.dart';
import 'package:loy_eat_merchant_app/src/screens/order/order_screen.dart';
import 'package:loy_eat_merchant_app/src/screens/order/order_view_model.dart';

import '../screens/home/home_screen.dart';

// ignore: must_be_immutable
class BottomNavigationBarExample extends StatefulWidget {
  late int index;

  BottomNavigationBarExample({Key? key, required this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  final cacheHelper = CacheHelper();

  final homeViewModel = Get.put(HomeViewModel());
  final menuViewModel = Get.put(MenuViewModel());
  final orderViewModel = Get.put(OrderViewModel());
  final accountViewModel = Get.put(AccountViewModel());

  final merchantCollection = FirebaseFirestore.instance.collection('merchants');

  @override
  void initState() {
    super.initState();
    readCacheHelper();
  }


  void readCacheHelper() async {
    String id = await cacheHelper.readCache();
    
    homeViewModel.merchantId.value = '';
    menuViewModel.merchantId.value = '';
    orderViewModel.merchantId.value = '';
    accountViewModel.merchantId.value = '';

    homeViewModel.merchantId.value = id;
    menuViewModel.merchantId.value = id;
    orderViewModel.merchantId.value = id;
    accountViewModel.merchantId.value = id;
  }

  @override
  Widget build(BuildContext context) {
    final kTabPages = <Widget>[
      HomeScreen(),
      MenuScreen(),
      OrderScreen(),
      AccountScreen(),
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
      currentIndex: widget.index,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryColor,
      onTap: (int index) {
        setState(() {
          widget.index = index;
        });
      },
    );
    return Scaffold(
      body: kTabPages[widget.index],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
