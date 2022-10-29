import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/src/screens/account/account_view_model.dart';
import '../../constants/constants.dart';
import '../../utility/button.dart';
import '../../utility/text_style.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);

  final accountViewModel = Get.put(AccountViewModel());

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
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 60,
                    width: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(accountViewModel.merchantImage),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Expanded(child: Text(accountViewModel.merchantName, style: AppTextStyle.headline1)),

              ],
            ),
          ),
          const SizedBox(
            height: defaultPaddin,
          ),
          Container(
            height: 302,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultPaddin),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPaddin, vertical: defaultPaddin),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(defaultPaddin),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPaddin, vertical: defaultPaddin),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.call,
                            color: secondGrayColor,
                            size: 20,
                          ),
                          SizedBox(
                            width: defaultPaddin / 2,
                          ),
                          Text('Profile', style: TextStyle(fontSize: 13)),
                          Spacer(),
                          Icon(
                            Icons.chevron_right,
                            color: secondGrayColor,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(defaultPaddin),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPaddin, vertical: defaultPaddin),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.location_on_rounded,
                            color: secondGrayColor,
                            size: 20,
                          ),
                          SizedBox(
                            width: defaultPaddin / 2,
                          ),
                          Text('Address', style: TextStyle(fontSize: 13)),
                          Spacer(),
                          Icon(
                            Icons.chevron_right,
                            color: secondGrayColor,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(defaultPaddin),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPaddin, vertical: defaultPaddin),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.settings,
                            color: secondGrayColor,
                            size: 20,
                          ),
                          SizedBox(
                            width: defaultPaddin / 2,
                          ),
                          Text('Setting', style: TextStyle(fontSize: 13)),
                          Spacer(),
                          Icon(
                            Icons.chevron_right,
                            color: secondGrayColor,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(defaultPaddin),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPaddin, vertical: defaultPaddin),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.contact_support,
                            color: secondGrayColor,
                            size: 20,
                          ),
                          SizedBox(
                            width: defaultPaddin / 2,
                          ),
                          Text('Need Support', style: TextStyle(fontSize: 13)),
                          Spacer(),
                          Icon(
                            Icons.chevron_right,
                            color: secondGrayColor,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: defaultPaddin,
                          vertical: defaultPaddin / 2),
                      child: Text(
                        'Version 0.0.1',
                        style: TextStyle(color: secondGrayColor, fontSize: 13),
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: defaultPaddin * 4,
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
