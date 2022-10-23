import 'package:flutter/material.dart';
import 'package:loy_eat_merchant_app/src/constants/constants.dart';
import 'package:loy_eat_merchant_app/src/utility/text_style.dart';

class AppStatus {
  static Widget done(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        padding: const EdgeInsets.all(defaultPaddin * 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultPaddin),
            color: whiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: primaryColor,
              size: 100,
            ),
            const SizedBox(
              height: defaultPaddin / 2,
            ),
            Text(
              'Thank You',
              style: AppTextStyle.headline1,
            ),
            const SizedBox(
              height: defaultPaddin,
            ),
            const Text('You are now submitted!'),
          ],
        ),
      ),
    );
  }
}
