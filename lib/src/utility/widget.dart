import 'package:flutter/material.dart';
import 'package:loy_eat_merchant_app/src/utility/text_style.dart';

import '../constants/constants.dart';

class AppWidget {
  static Widget product({ required BuildContext context, required VoidCallback onTap, required String image, required String titleText, required String dateOrder, required String subTitleText, required String price}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        margin: const EdgeInsets.only(bottom: defaultPaddin / 2, top: defaultPaddin / 6),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(defaultPaddin / 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(defaultPaddin / 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 72,
                width: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultPaddin / 4),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: defaultPaddin / 2,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleText,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.headline2,
                    ),
                    const SizedBox(
                      height: defaultPaddin / 2,
                    ),
                    Text(
                      dateOrder,
                      style:
                          AppTextStyle.title2.copyWith(color: secondGrayColor),
                    ),
                    const Spacer(),
                    Text(
                      subTitleText,
                      style: AppTextStyle.title2.copyWith(color: primaryColor),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ $price',
                    style: AppTextStyle.headline1,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green.shade600.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(defaultPaddin / 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: defaultPaddin,
                        vertical: defaultPaddin / 6,
                      ),
                      child: Text(
                        'Approved',
                        style: AppTextStyle.title2.copyWith(
                          color: Colors.green.shade600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget order({required BuildContext context, required VoidCallback onTap, required String orderId, required String orderDate, required String orderTime, required String productName, required String qty, required String amount}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        margin: const EdgeInsets.only(bottom: defaultPaddin / 6, top: defaultPaddin / 2),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(defaultPaddin / 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(defaultPaddin / 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order #: $orderId',
                      style: AppTextStyle.headline2,
                    ),
                    const SizedBox(
                      height: defaultPaddin / 2,
                    ),
                    Text(
                      'Item: $productName x $qty ...',
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.title2,
                    ),
                    const Spacer(),
                    Text(
                      '$orderDate $orderTime',
                      style: AppTextStyle.title2.copyWith(color: secondGrayColor),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ $amount',
                    style: AppTextStyle.headline1,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange.shade600.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(defaultPaddin / 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: defaultPaddin,
                        vertical: defaultPaddin / 6,
                      ),
                      child: Text(
                        'Pending',
                        style: AppTextStyle.title2.copyWith(
                          color: Colors.orange.shade600,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget card2(BuildContext context, String title, int amount) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.all(defaultPaddin),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(defaultPaddin / 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.headline2,
          ),
          const SizedBox(
            height: defaultPaddin / 2,
          ),
          Text(
            amount.toString(),
            style: AppTextStyle.title2.copyWith(fontSize: 32),
          )
        ],
      ),
    );
  }

  static Widget card1({required BuildContext context, required String title, required IconData icon, required int amount, Color backgroundColor = whiteColor}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.all(defaultPaddin),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(defaultPaddin / 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Icon(
                icon,
                color: whiteColor,
                size: 32,
              ),
              const SizedBox(
                height: defaultPaddin / 2,
              ),
              Text(
                title,
                style: AppTextStyle.headline2.copyWith(color: whiteColor),
              ),
            ],
          ),
          Text(
            amount.toString(),
            style: AppTextStyle.headline1.copyWith(color: whiteColor, fontSize: 32),
          )
        ],
      ),
    );
  }

  static Widget get loading {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  static Widget get noOrderData {
    return Center(
      child: Text('No Order Yet!', style:  AppTextStyle.headline1),
    );
  }

  static Widget get error {
    return const Text('Error while loading data from server.');
  }
}