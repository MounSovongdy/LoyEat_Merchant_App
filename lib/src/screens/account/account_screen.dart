import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../utility/button.dart';
import '../../utility/text_style.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGrayColor,
      appBar: getAppBar(context),
      body: getProduct(context),
    );
  }

  Widget getProduct(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPaddin, vertical: defaultPaddin),
      child: ListView(
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultPaddin),
              color: Colors.white,
            ),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.all(defaultPaddin / 2),
                child: Container(
                    height: 60,
                    width: 70,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/profile.jpg'),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPaddin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [],
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: defaultPaddin,
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultPaddin),
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: defaultPaddin,
          ),
          AppButton.button1('Log Out', onTap: () {}, leftIcon: Icons.logout),
        ],
      ),
    );
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      centerTitle: true,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Text(
        'Account',
        style: AppTextStyle.headline1.copyWith(color: whiteColor),
      ),
    );
  }
}
