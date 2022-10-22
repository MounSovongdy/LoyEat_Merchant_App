import 'package:flutter/material.dart';
import 'package:loy_eat_merchant_app/src/srceen/order_datail_srceen.dart';

class ListOrderReportSrceen extends StatefulWidget {
  const ListOrderReportSrceen({Key? key}) : super(key: key);

  @override
  State<ListOrderReportSrceen> createState() => _ListSrceenState();
}
class _ListSrceenState extends State<ListOrderReportSrceen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbar,
        body: body,
        //backgroundColor: const Color.fromARGB(255, 199, 199, 198),
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
      itemCount: 14,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding (
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                child: Text('Date: 22-Oct-22'),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8, vertical: 2),
                  child: Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
              InkWell(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  height: 80,
                  decoration: BoxDecoration(
                    color:Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  child: const Icon(Icons.key_rounded)
                                ),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  child: const Text('ID: 221022001',
                                    style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  child: const Text('\$11.50',
                                    style:
                                      TextStyle(fontWeight: FontWeight.bold,color: Colors.blue))
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  child: const Icon(Icons.person)
                                ),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  child: const Text('Sovongdy',
                                    style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  child: const Text('10:43AM',style: TextStyle(fontSize: 12)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                          MaterialPageRoute(
                            builder: (context) => const OrderDetailScreen()),
                      );
                    }
                  ),
            ],
          ),
        );
          },
    );
  }
}