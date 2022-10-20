import 'package:flutter/material.dart';

class HomeSrceen extends StatefulWidget {
  const HomeSrceen({Key? key}) : super(key: key);

  @override
  State<HomeSrceen> createState() => _HomeSrceenState();
}

class _HomeSrceenState extends State<HomeSrceen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbar,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
        backgroundColor: const Color.fromARGB(255, 199, 199, 198),
      ),
    );
  }

  final appbar = AppBar(
    title: const Text('Home'),
    //backgroundColor: Colors.white,
  );

  Widget get body{
    return Container(

    );
  }

  Widget get bottomNavigationBar{
    return BottomNavigationBar(
      currentIndex : 2,
      items:const [
        BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
        ),
        BottomNavigationBarItem(
        icon: Icon(Icons.add),
        label: 'Add',
        ),
        BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Account',
        ),
      ]
    );
  }
}