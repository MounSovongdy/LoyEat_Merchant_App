import 'package:flutter/material.dart';

class ListSrceen extends StatefulWidget {
  const ListSrceen({Key? key}) : super(key: key);

  @override
  State<ListSrceen> createState() => _ListSrceenState();
}
class _ListSrceenState extends State<ListSrceen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbar,
        body: body,
        backgroundColor: const Color.fromARGB(255, 199, 199, 198),
      ),
    );
  }

  final appbar = AppBar(
    title: const Text('List Product'),
    //backgroundColor: Colors.white,
  );

  Widget get body {
    return ListView.builder(
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
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
          },
        );
  }
}