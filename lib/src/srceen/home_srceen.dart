// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:loy_eat_merchant_app/src/srceen/list_order_report_srceen.dart';
import 'package:loy_eat_merchant_app/src/srceen/new_order_datail_screen.dart';

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
        //bottomNavigationBar: bottomNavigationBar,
        //backgroundColor: const Color.fromARGB(255, 199, 199, 198),
      ),
    );
  }

  final appbar = AppBar(
    title: const Text('Home'),
    //backgroundColor: Colors.white,
  );

  Widget get body {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      width: 165,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.green.withOpacity(0.7),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: const [
                            Text('Acceted ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Spacer(),
                            Text('02',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListOrderReportSrceen()),
                    );
                  }),
              InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      width: 165,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.red.withOpacity(0.7),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: const [
                            Text('Rejected ',
                                style: TextStyle(
                                  color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Spacer(),
                            Text('02',
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListOrderReportSrceen()),
                    );
                  }),
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: const Color.fromARGB(255, 235, 240, 245),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: const [
                      Text(
                        'New Order',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Container(
                height: 440,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: const Color.fromARGB(255, 235, 240, 245),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: const Icon(Icons.notifications_active_rounded,color: Colors.blue,)
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: const Text('ID: 221022001',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: const Text('10:43AM',
                                  style:
                                    TextStyle(fontWeight: FontWeight.bold,color: Colors.blue))
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewOrderDatailScreen()),
                        );
                      }
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
