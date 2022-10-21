import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({Key? key}) : super(key: key);

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  final productname = TextEditingController();
  final price = TextEditingController();
  final promotion = TextEditingController();
  final detail = TextEditingController();

  final products = FirebaseFirestore.instance.collection('products');

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
    title: const Text('Add Product'),
    //backgroundColor: Colors.white,
  );

  Widget get body {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all()
                        ),
                    child: const Text('Image'),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {

          }
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                textEditingController(
                  controller: productname,
                  labletext: 'Product Name',
                ),
                textEditingController(
                  controller: price,
                  labletext: 'Price',
                  inputType: TextInputType.number,
                ),
                textEditingController(
                  controller: detail,
                  labletext: 'Detail',
                ),
              ],
            ),
          ),
          addnew,
        ],
      ),
    );
  }

  Widget textEditingController({
    required TextEditingController controller,
    required String labletext,
    Widget? suffixIcon,
    TextInputType inputType = TextInputType.text,
  }) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: TextField(
          keyboardType: inputType,
          controller: controller,
          obscureText: false,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            border: const OutlineInputBorder(),
            labelText: labletext,
          ),
          onSubmitted: (value) {
            controller.text = value;
          },
        ),
      ),
    ]);
  }

  Widget get addnew {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Container(
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.blue,
          ),
          child: const Text('Add New', style: TextStyle(color: Colors.white)),
        ),
      ),
      onTap: () {
        products.add({
          'product_name': productname.text,
          'price': price.text,
          'detail': detail.text,
          // 'create_at':'',
          // 'image': 'assets/image/',
          // 'merchant_id': '4',
          // 'product_id': '8',
        }).then((value) {
          debugPrint('Product Added');
        });
        productname.clear();
        price.clear();
        detail.clear();
      },
    );
  }
}
