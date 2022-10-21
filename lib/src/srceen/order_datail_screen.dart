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
          child: Container(            
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child:  Center(
                    child: Text('Order Detail',style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: const [
                      Text('Order Date:   '),
                      Text('21-Oct-2022'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: const [
                      Text('Order Time:   '),
                      Text('11:45AM'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: const [
                      Text('Customer Name:   '),
                      Text('Jonh Walker'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}