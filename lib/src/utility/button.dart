import 'package:flutter/material.dart';
import 'package:loy_eat_merchant_app/src/utility/text_style.dart';

import '../constants/constants.dart';

class AppButton {
  static Widget button1(String text,
      {required VoidCallback onTap,
      Color backgroundColor = primaryColor,
      IconData? leftIcon,
      IconData? rightIcon,
      Color color = whiteColor}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(defaultPaddin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leftIcon != null)
              Icon(
                leftIcon,
                color: color,
              ),
            if (leftIcon != null)
              const SizedBox(
                width: defaultPaddin,
              ),
            Text(
              text,
              style: AppTextStyle.headline1.copyWith(color: color),
            ),
            if (rightIcon != null)
              const SizedBox(
                width: defaultPaddin,
              ),
            if (rightIcon != null)
              Icon(
                rightIcon,
                color: color,
              ),
          ],
        ),
      ),
    );
  }

  static Widget button2(String text,
      {required VoidCallback onTap,
      Color backgroundColor = primaryColor,
      IconData? leftIcon,
      IconData? rightIcon,
      Color color = whiteColor}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leftIcon != null)
              Icon(
                leftIcon,
                color: color,
              ),
            if (leftIcon != null)
              const SizedBox(
                width: defaultPaddin / 2,
              ),
            Text(
              text,
              style: AppTextStyle.headline2.copyWith(color: color),
            ),
            if (rightIcon != null)
              const SizedBox(
                width: defaultPaddin,
              ),
            if (rightIcon != null)
              Icon(
                rightIcon,
                color: color,
              ),
          ],
        ),
      ),
    );
  }
}
