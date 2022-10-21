// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:loy_eat_merchant_app/src/widget/list_new_order_widget.dart';

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
                      MaterialPageRoute(builder: (context) => const ListSrceen()),
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
                            Text('Reject ',
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
                      MaterialPageRoute(builder: (context) => const ListSrceen()),
                    );
                  }),
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10,vertical:0),
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
                        Text('New Order',style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10,vertical:0),
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
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Container(
                                    height: 72.0,
                                    width: 72.0,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage('assets/image/amazon_coffee.jpg'),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  child: const Text('',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold)),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  child: const Text('',
                                      style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        
                      },
                    );
                    // return Card(
                    //   child: Column(
                    //     children: [
                    //       const ListTile(
                    //         leading: Text('ID: 221021004',style: TextStyle(
                    //           fontSize: 14, fontWeight: FontWeight.bold),
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.symmetric(horizontal:32,vertical:2),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //           children: const [
                    //             Text('Bay Sor'),
                    //             Text('X2'),
                    //             Text('\$1.50'),
                    //           ],
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.symmetric(horizontal:32,vertical:2),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //           children: const [
                    //             Text('Bay Sor'),
                    //             Text('X2'),
                    //             Text('\$1.50'),
                    //           ],
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.symmetric(horizontal:32,vertical:2),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //           children: const [
                    //             Text('Bay Sor'),
                    //             Text('X2'),
                    //             Text('\$1.50'),
                    //           ],
                    //         ),
                    //       ),
                    //       ButtonBar(
                    //         alignment: MainAxisAlignment.spaceAround,
                    //         children: [
                    //           FlatButton(
                    //             textColor: Colors.red.withOpacity(0.7),
                    //             onPressed: () {
                                  
                    //             },
                    //             child: const Text('Reject'),
                    //           ),
                    //           FlatButton(
                    //             textColor: Colors.green.withOpacity(0.7),
                    //             onPressed: () {
                                  
                    //             },
                    //             child: const Text('Accect')
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // );
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
