import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../utility/text_style.dart';
import '../../utility/widget.dart';
import 'order_accepted_detail_screen.dart';

class AcceptedScreen extends StatelessWidget {
  const AcceptedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGrayColor,
      appBar: getAppBar(context),
      body: getOrder(context),
    );
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      centerTitle: true,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Text(
        'Accepted',
        style: AppTextStyle.headline1.copyWith(color: whiteColor),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop(false);
        },
        icon: const Icon(Icons.arrow_back_ios_rounded),
      ),
    );
  }

  Widget getOrder(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: defaultPaddin),
        itemCount: 3,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, index) => AppWidget.order(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderAcceptedDetailScreen(),
              ),
            );
          },
          amount: '20.00',
          orderDate: '29-Oct-22',
          orderId: '291022001',
          orderTime: '9:30AM',
          productName: 'Crispy Tender Onebox',
          context: context,
          qty: '1',
          status: 'Accepted',
        ),
      ),
    );
  }
}
