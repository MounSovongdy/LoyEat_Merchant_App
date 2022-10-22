import 'package:flutter/material.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
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
    title: const Text('Detail'),
  );

  Widget get body{
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child:  Center(
                  child: Text('ID: 221022001',style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: const [
                    Text('Order Date:   '),
                    Text('21-Oct-2022',style: TextStyle(
                    fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: const [
                    Text('Order Time:   '),
                    Text('11:45AM',style: TextStyle(
                    fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: const [
                    Text('Customer Name:   '),
                    Text('Jonh Walker',style: TextStyle(
                    fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: const [
                    Text('Items Order:',style: TextStyle(
                    fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8, vertical: 4),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 2,
                      child: Text('Title',style: TextStyle(
                      fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text('Quantity',style: TextStyle(
                      fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text('Line Total',style: TextStyle(
                      fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8, vertical: 4),
                child: Container(
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8, vertical: 4),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 2,
                      child: Text('Green Tea'),
                    ),
                    Expanded(
                      child: Text('1'),
                    ),
                    Expanded(
                      child: Text('\$2.30'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8, vertical: 4),
                child: Container(
                  height: 1,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8, vertical: 4),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 2,
                      child: Text('Black Coffee'),
                    ),
                    Expanded(
                      child: Text('1'),
                    ),
                    Expanded(
                      child: Text('\$2.30'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8, vertical: 4),
                child: Container(
                  height: 1,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8, vertical: 4),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 2,
                      child: Text('Amazon Coffee'),
                    ),
                    Expanded(
                      child: Text('1'),
                    ),
                    Expanded(
                      child: Text('\$2.30'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8, vertical: 4),
                child: Container(
                  height: 1,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8, vertical: 4),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 2,
                      child: Text('Capucino'),
                    ),
                    Expanded(
                      child: Text('1'),
                    ),
                    Expanded(
                      child: Text('\$2.30'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8, vertical: 4),
                child: Container(
                  height: 1,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8, vertical: 4),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 2,
                      child: Text('Tea'),
                    ),
                    Expanded(
                      child: Text('1'),
                    ),
                    Expanded(
                      child: Text('\$2.30'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8, vertical: 4),
                child: Container(
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8, vertical: 4),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 2,
                      child: Text(''),
                    ),
                    Expanded(
                      child: Text('SubTotal'),
                    ),
                    Expanded(
                      child: Text('\$11.50'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8, vertical: 4),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 2,
                      child: Text(''),
                    ),
                    Expanded(
                      child: Text('Discount'),
                    ),
                    Expanded(
                      child: Text('\$0.00'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8, vertical: 4),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 2,
                      child: Text(''),
                    ),
                    Expanded(
                      child: Text('Total'),
                    ),
                    Expanded(
                      child: Text('\$11.50',style: TextStyle(
                        fontWeight: FontWeight.bold,fontSize: 16,color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}