import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:loy_eat_merchant_app/src/utility/text_style.dart';

import '../constants/constants.dart';

class AppWidget {
  static Widget product(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(
          bottom: defaultPaddin / 6, top: defaultPaddin / 6),
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
                image: const DecorationImage(
                  image: AssetImage('assets/image/profile.jpg'),
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
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hanuman Beer',
                    style: AppTextStyle.headline2,
                  ),
                  const SizedBox(
                    height: defaultPaddin / 2,
                  ),
                  Text(
                    '14-Jan-22',
                    style:
                        AppTextStyle.title2.copyWith(color: secondGraydColor),
                  ),
                  const Spacer(),
                  Text(
                    'Beer',
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
                  '3.5',
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
            )
          ],
        ),
      ),
    );
  }

  static Widget order(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(
          bottom: defaultPaddin / 6, top: defaultPaddin / 6),
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
                    'Order #: le001444b',
                    style: AppTextStyle.headline2,
                  ),
                  const SizedBox(
                    height: defaultPaddin / 2,
                  ),
                  Text(
                    'Item: Hanuman Beer 500ml x1... ',
                    style: AppTextStyle.title2,
                  ),
                  const Spacer(),
                  Text(
                    '14-Jan-22',
                    style:
                        AppTextStyle.title2.copyWith(color: secondGraydColor),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '3.5',
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
                      'Panding',
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

  static Widget card1(
      {required BuildContext context,
      required String title,
      required IconData icon,
      required int amount,
      Color backgroundColor = whiteColor}) {
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
            style: AppTextStyle.headline1
                .copyWith(color: whiteColor, fontSize: 32),
          )
        ],
      ),
    );
  }
}
